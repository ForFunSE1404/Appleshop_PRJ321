package fpt.edu.project.controller;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fpt.edu.project.model.Category;
import fpt.edu.project.model.Product;
import fpt.edu.project.service.CategoryServiceImpl;
import fpt.edu.project.service.ImageServiceImpl;
import fpt.edu.project.service.ProductServiceImpl;

@Controller
public class ProductAdminController {
	@Autowired
	public ProductServiceImpl productService;
	@Autowired
	public CategoryServiceImpl cateService;
	@Autowired
	public ImageServiceImpl imageService;

	@RequestMapping(value = "admin/products")
	public String showProduct(@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size,
			@RequestParam(name = "keySearch", required = false) String keySearch, ModelMap model) {
		page = page - 1;
		long numpage = 1;
		List<Product> listProduct = null;
		Pageable pageable = PageRequest.of(page, size);
		if (keySearch == null) {
			listProduct = productService.findProducts(pageable).getContent();
			numpage = productService.countAllProducts();
		} else {
			listProduct = productService.findProductByName(keySearch, pageable).getContent();
			numpage = productService.countProductsByName(keySearch);
		}

		model.addAttribute("listproduct", listProduct);
		model.addAttribute("numpage", ((long) numpage / size) + 1);
		return "admin/showallproduct";
	}

	@RequestMapping(value = "admin/addproduct", method = RequestMethod.GET)
	public String addviewProduct(ModelMap model) {
		model.addAttribute("listCate", cateService.findAll());
		return "admin/addproduct";
	}

	@RequestMapping(value = "admin/addproduct", method = RequestMethod.POST)
	public String addProduct(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("thumbnail") MultipartFile image, @RequestParam("imagesOther") MultipartFile[] imagesOther) {
		// Tạo format cho date
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// Lấy thời gian hiện tại
		Date dateTime = new Date(System.currentTimeMillis());
		String date = formatter.format(dateTime);
		// Lấy thông tin Id,name,category,quantity,price,des,visibility
		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String categoryId = request.getParameter("category");
		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		boolean visibility = false;
		// Nếu visibility được chọn sẽ thành true
		if (request.getParameter("visibility") != null) {
			visibility = true;
		}
		// Kiểm tra trùng Id, nếu trùng thì thông báo Id is exist !
		if (productService.findById(productId).isPresent()) {
			model.addAttribute("errID", "Product ID " + productId + " is exist !");
		}
		// Kiểm tra các ảnh đưa vào số lượng lớn 5, thông báo chọn dưới 5 ảnh
		else if (imagesOther.length > 5) {
			model.addAttribute("errImages", "Choose less than 5 images !");
		}
		// Lưu ảnh
		else {
			// Tạo đường dẫn cho thumbnail
			Path pathThumbnail = Paths.get("src/main/webapp/images_Product/" + productId + "/");
			// Tạo đường dẫn cho Images
			Path pathImages = Paths.get("src/main/webapp/images_Product/" + productId + "/Images/");
			try {
				// Tạo InputStream cho ảnh thumbnail
				InputStream inputStreamThumbnail = image.getInputStream();
				// Tạo mảng InputStream cho các ảnh Images
				InputStream[] inputStreamImages = new InputStream[imagesOther.length];
				// InputStream từng ảnh trong mảng Images
				for (int i = 0; i < imagesOther.length; i++) {
					inputStreamImages[i] = imagesOther[i].getInputStream();
				}
				// Kiểm tra nếu các đường dẫn của pathThumbnail và pathImages không tồn tại.
				if (pathThumbnail != null && pathImages != null) {
					// Tạo đường dẫn file với pathThumbnail và pathImages
					Files.createDirectories(pathThumbnail);
					Files.createDirectories(pathImages);
					// Đặt tên cho ảnh thumbnail
					String fileName1 = productId + "_thumbnail.png";
					// Đặt một mảng tên cho các ảnh của Images
					String[] fileName2 = new String[imagesOther.length];
					for (int i = 0; i < imagesOther.length; i++) {
						fileName2[i] = productId + "(" + (i + 1) + ").png";
					}
					// Lưu ảnh thambnail và save Product
					Files.copy(inputStreamThumbnail, pathThumbnail.resolve(fileName1));
					productService.insertProduct(productId, categoryId, productName, date, Integer.parseInt(quantity),
							Double.parseDouble(price), "images_Product/" + productId + "/" + fileName1, description,
							visibility);
					// Lưu các ảnh Images và save Images
					for (int i = 0; i < imagesOther.length; i++) {
						Files.copy(inputStreamImages[i], pathImages.resolve(fileName2[i]));
						imageService.saveImg("images_Product/" + productId + "/Images/" + fileName2[i], productId);
					}

					System.err.println("Successful !!!!");
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.err.println("Error !!!!");
			}
		}
		model.addAttribute("listCate", cateService.findAll());
		return "redirect:admin/products";
	}

	@RequestMapping(value = "admin/deleteproduct", method = RequestMethod.POST)
	public String deleteProduct(Model model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("productId");
		productService.deleteById(id);
		model.addAttribute("listproduct", productService.findAll());
		return "admin/showallproduct";
	}

	@RequestMapping(value = "admin/editproduct", method = RequestMethod.GET)
	public String editProductView(Model model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("productId");
		Product pro = productService.findById(id).get();
		model.addAttribute("listCate", cateService.findAll());
		model.addAttribute("product", pro);
		return "admin/addproduct";
	}

	@RequestMapping(value = "admin/editproduct", method = RequestMethod.POST)
	public String editProduct(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("thumbnail") MultipartFile image, @RequestParam("imagesOther") MultipartFile[] imagesOther) {
		// Lấy ngày và giờ hiện tại
		Date dateTime = new Date(System.currentTimeMillis());
		// Lấy thông tin của các thuộc tính cần update
		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String categoryId = request.getParameter("category");
		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		boolean visibility = false;
		if (request.getParameter("visibility") != null) {
			visibility = true;
		}
		// Kiểm tra nếu ảnh đưa vào số lượng lớn hơn 5 sẽ thông báo chọn dưới 5 ảnh
		if (imagesOther.length > 5) {
			model.addAttribute("errImages", "Choose less than 5 images !");
		}
		// Kiểm tra ID đã tồn tại
		else if (productService.findById(productId).isPresent()) {
			// Tạo đường dẫn cho ảnh thumbnail và các ảnh Images
			Path pathThumbnail = Paths.get("src/main/webapp/images_Product/" + productId + "/");
			Path pathImages = Paths.get("src/main/webapp/images_Product/" + productId + "/Images/");
			// Tạo file với đường dẫn của pathImages
			File file2 = new File(String.valueOf(pathImages));

			try {
				// InputStream ảnh thumbnail và tạo mảng InputStream các ảnh Images
				InputStream inputStreamThumbnail = image.getInputStream();
				InputStream[] inputStreamImages = new InputStream[imagesOther.length];
				// Tạo cờ để kiểm tra xem folder Images đã được xóa hay chưa
				boolean checkDelete = true;
				// Kiểm tra nếu tên OriginalFilename của phần tử đầu tiên trong mảng imagesOther
				// không là "" thì gọi hàm deleteDir và checkDelete = false;
				if (!imagesOther[0].getOriginalFilename().equals("")) {
					deleteDir(file2);
					checkDelete = false;
				}
				// InputStream cho mảng Images
				for (int i = 0; i < imagesOther.length; i++) {
					inputStreamImages[i] = imagesOther[i].getInputStream();
				}
				// Kiểm tra các pathThumbnail và pathImages không tồn tại
				if (pathThumbnail != null && pathImages != null) {
					// Tạo đường dẫn file với pathThumbnail và pathImages
					Files.createDirectories(pathThumbnail);
					Files.createDirectories(pathImages);
					// Đặt tên cho thumbnail
					String fileName1 = productId + "_thumbnail.png";
					// Đặt tên cho mảng Images
					String[] fileName2 = new String[imagesOther.length];
					for (int i = 0; i < imagesOther.length; i++) {
						fileName2[i] = productId + "(" + (i + 1) + ").png";
					}
					// Nếu OriginalFilename không rỗng thì lưu ảnh thumbnail và save Product
					if (!image.getOriginalFilename().equals("")) {
						Files.copy(inputStreamThumbnail, pathThumbnail.resolve(fileName1),
								StandardCopyOption.REPLACE_EXISTING);
					}
					productService.save(new Product(productId, new Category(categoryId), productName, dateTime,
							Integer.parseInt(quantity), Double.parseDouble(price), description,
							"images_Product/" + productId + "/" + fileName1, visibility));
					// Kiểm tra checkDelete = false
					if (checkDelete == false) {
						// Xóa tất cả Img trong data theo productId
						imageService.deleteImg(productId);
						// Thực hiện lưu các ảnh Images và lưu lại các Images mới.
						for (int i = 0; i < imagesOther.length; i++) {
							Files.copy(inputStreamImages[i], pathImages.resolve(fileName2[i]),
									StandardCopyOption.REPLACE_EXISTING);
							imageService.saveImg("images_Product/" + productId + "/Images/" + fileName2[i], productId);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.err.println("Error !!!!");
			}
		}
		model.addAttribute("listCate", cateService.findAll());
		return "admin/addproduct";
	}

	@InitBinder
	public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
		final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", locale);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

//	@RequestMapping(value = "admin/searchproducts", method = RequestMethod.GET)
//	public String searchproduct(@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
//			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size, ModelMap model,
//			@RequestParam(name = "txtName") String name) {
//		Pageable pageable = PageRequest.of(page, size);
//		int num = (int) Math.ceil(productService.count() / 10);
//		model.addAttribute("numpage", num);
//		model.addAttribute("listproduct", productService.searchproduct(pageable, name).getContent());
//		return "admin/showallproduct";
//	}

	public static void deleteDir(File file) {
		// neu file la thu muc thi xoa het thu muc con va file cua no
		if (file.isDirectory()) {
			// liet ke tat ca thu muc va file
			String[] files = file.list();
			for (String child : files) {
				File childDir = new File(file, child);
				if (childDir.isDirectory()) {
					// neu childDir la thu muc thi goi lai phuong thuc deleteDir()
					deleteDir(childDir);
				} else {
					// neu childDir la file thi xoa
					childDir.delete();
				}
			}
			// Check lai va xoa thu muc cha
			if (file.list().length == 0) {
				file.delete();
			}

		} else {
			// neu file la file thi xoa
			file.delete();
		}
	}
}
