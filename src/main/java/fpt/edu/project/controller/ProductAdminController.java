package fpt.edu.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fpt.edu.project.model.Category;
import fpt.edu.project.model.FileUpload;
import fpt.edu.project.model.Product;
import fpt.edu.project.service.CategoryServiceImpl;
import fpt.edu.project.service.ProductServiceImpl;

@Controller
public class ProductAdminController {
	@Autowired
	public ProductServiceImpl productService;
	@Autowired
	public CategoryServiceImpl cateService;

	@RequestMapping(value = "products", method = RequestMethod.GET)
	public String showProduct(Model model) {
		model.addAttribute("listproduct", productService.findAll());
		return "admin/showallproduct";
	}

	@RequestMapping(value = "products/delete?productId=", method = RequestMethod.POST)
	public String deleteProduct() {
		
		return "admin/showallproduct";
	}
	
//	@RequestMapping(value = "products", method = RequestMethod.GET)
//	public String editProduct(Model model, HttpServletRequest request, HttpServletResponse response){
//		
//		return "admin/showallproduct";
//	}
	@RequestMapping(value = "admin/addproduct", method = RequestMethod.GET)
	public String addproduct(Model model) {
		model.addAttribute("listCate", cateService.findAll());
		return "admin/addproduct";
	}


	@RequestMapping(value = "admin/addproduct", method = RequestMethod.POST)
	public String addProduct(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("thumbnail") MultipartFile image, @RequestParam("imagesOther") MultipartFile imagesOther) {
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
			Path path = Paths.get("src/main/webapp/images_Product/" + productId + "/");
			try{
				InputStream inputStream1 = image.getInputStream();
				InputStream inputStream2 = imagesOther.getInputStream();
				if (path != null) {
					Files.createDirectories(path);
					String fileName1 = image.getOriginalFilename();
					String fileName2 = imagesOther.getOriginalFilename();
//			if(Files.exists(Paths.get("images/"+productId+"/"+fileName1))) {
//				String type = fileName1.substring(fileName1.lastIndexOf("."));
//				String name = fileName1.substring(0, fileName1.lastIndexOf("."));
//				fileName1 = checkName(name, path.toString()+"/");
//				fileName1 += type;
//				System.out.println("===="+type+"===="+name+"====="+fileName1);
//			}
					Files.copy(inputStream1, path.resolve(fileName1), StandardCopyOption.REPLACE_EXISTING);
					Files.copy(inputStream2, path.resolve(fileName2), StandardCopyOption.REPLACE_EXISTING);
//					productService.insertProduct(productId, categoryId, productName, date, Integer.parseInt(quantity),
//							Double.parseDouble(price), "images_Product/" + productId + "/" + fileName1, description,
//							visibility);
//					productService.insertImage(productId, "images_Product/" + productId + "/" + fileName2);
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

//	public String checkName(String nameFile, String path) {
//		File file = new File(path);
//		File[] files = file.listFiles();
//		System.out.println("===============");
//		String[] nameFiles = new String[files.length];
//		for (int i = 0; i < files.length; i++) {
//			nameFiles[i] = files[i].getName().substring(0, files[i].getName().lastIndexOf("."));
//			System.out.println(nameFiles[i]);
//		}
//		int j = 0;
//		while (j > nameFiles.length) {
//			if (nameFile.equalsIgnoreCase(nameFiles[j])) {
//				nameFile += "(" + j + 1 + ")";
//			}
//			j++;
//		}
//		return nameFile;
//	}
}
