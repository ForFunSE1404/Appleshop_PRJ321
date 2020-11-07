package fpt.edu.project.controller;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
import fpt.edu.project.service.ProductServiceImpl;

@Controller
public class ProductAdminController {
	@Autowired
	public ProductServiceImpl productService;
	@Autowired
	public CategoryServiceImpl cateService;

	@RequestMapping(value = "admin/products", method = RequestMethod.GET)
	public String showProduct(@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size, ModelMap model) {
		Pageable pageable = PageRequest.of(page, size);
		int num = (int) Math.ceil(productService.count() / 10);
		model.addAttribute("numpage", num);
		model.addAttribute("listproduct", productService.findProducts(pageable).getContent());
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
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateTime = new Date(System.currentTimeMillis());
		String date = formatter.format(dateTime);
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
		if (productService.findById(productId).isPresent()) {
			model.addAttribute("errID", "Product ID " + productId + " is exist !");
		} else {
			Path path1 = Paths.get("src/main/webapp/images_Product/" + productId + "/");
			Path path2 = Paths.get("src/main/webapp/images_Product/" + productId + "/Images/");
			try {
				InputStream inputStream1 = image.getInputStream();
				InputStream[] inputStream2 = new InputStream[imagesOther.length];
				for (int i = 0; i < imagesOther.length; i++) {
					inputStream2[i] = imagesOther[i].getInputStream();
				}
				if (path1 != null && path2 != null) {
					Files.createDirectories(path1);
					Files.createDirectories(path2);
					String fileName1 = productId + "_thumbnail.png";
					String[] fileName2 = new String[imagesOther.length];
					for (int i = 0; i < imagesOther.length; i++) {
						fileName2[i] = productId + "(" + (i + 1) + ").png";
					}

					Files.copy(inputStream1, path1.resolve(fileName1));
					productService.insertProduct(productId, categoryId, productName, date, Integer.parseInt(quantity),
							Double.parseDouble(price), "images_Product/" + productId + "/" + fileName1, description,
							visibility);

					for (int i = 0; i < imagesOther.length; i++) {
						Files.copy(inputStream2[i], path2.resolve(fileName2[i]));
//						productService.insertImage(productId, "images_Product/" + productId + "/" + fileName2[i]);
					}
					System.err.println("Successful !!!!");
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.err.println("Error !!!!");
			}
		}
		model.addAttribute("listCate", cateService.findAll());
		return "admin/addproduct";
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

/////////////////////////
	@RequestMapping(value = "admin/editproduct", method = RequestMethod.POST)
	public String editProduct(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("thumbnail") MultipartFile image, @RequestParam("imagesOther") MultipartFile[] imagesOther) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateTime = new Date(System.currentTimeMillis());
		String productId = request.getParameter("productId");
		String date = formatter.format(dateTime);

		String productName = request.getParameter("productName");
		String categoryId = request.getParameter("category");
		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		System.out.println("===============================================");
		boolean visibility = false;
		if (request.getParameter("visibility") != null) {
			visibility = true;
		}
		if (productService.findById(productId).isPresent()) {
			Path path1 = Paths.get("src/main/webapp/images_Product/" + productId + "/");
			Path path2 = Paths.get("src/main/webapp/images_Product/" + productId + "/Images/");
			try {
				InputStream inputStream1 = image.getInputStream();
				InputStream[] inputStream2 = new InputStream[imagesOther.length];
				for (int i = 0; i < imagesOther.length; i++) {
					inputStream2[i] = imagesOther[i].getInputStream();
				}
				if (path1 != null && path2 != null) {
					Files.createDirectories(path1);
					Files.createDirectories(path2);
					String fileName1 = productId + "_thumbnail.png";
					String[] fileName2 = new String[imagesOther.length];
					for (int i = 0; i < imagesOther.length; i++) {
						fileName2[i] = productId + "(" + (i + 1) + ").png";
					}
					Files.copy(inputStream1, path1.resolve(fileName1), StandardCopyOption.REPLACE_EXISTING);
					productService.save(new Product(productId, new Category(categoryId), productName, dateTime,
							Integer.parseInt(quantity), Double.parseDouble(price), description,
							"images_Product/" + productId + "/" + fileName1, visibility));
					for (int i = 0; i < imagesOther.length; i++) {
						Files.copy(inputStream2[i], path2.resolve(fileName2[i]), StandardCopyOption.REPLACE_EXISTING);
//						productService.updateImage(productId, "images_Product/" + productId + "/" + fileName2[i]);
					}
					System.err.println("Successful !!!!");
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

	@RequestMapping(value = "admin/searchproducts", method = RequestMethod.GET)
	public String searchproduct(@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size, ModelMap model,
			@RequestParam(name = "txtName") String name) {
		Pageable pageable = PageRequest.of(page, size);
		int num = (int) Math.ceil(productService.count() / 10);
		model.addAttribute("numpage", num);
		model.addAttribute("listproduct", productService.searchproduct(pageable, name).getContent());
		return "admin/showallproduct";
	}

}
