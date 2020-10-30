//package fpt.edu.project.dao;
//
//import java.util.UUID;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transactional;
//
//import fpt.edu.project.model.Product;
//
//@Transactional
//@Repository
//public class Cart {
//	@Autowired
//	private SessionFactory sessionFactory;
//
//	@Autowired
//	private ProductDao productDao;
//
//	@Transactional(rollbackFor = Exception.class)
//	public void saveOrder(CartInfo cartInfo) {
//		Session session = this.sessionFactory.getCurrentSession();
//
//		int orderNum = this.getMaxOrderNum() + 1;
//		Order order = new Order();
//
//		order.setId(UUID.randomUUID().toString());
//		order.setOrderNum(orderNum);
//		order.setOrderDate(new Date());
//		order.setAmount(cartInfo.getAmountTotal());
//
//		CustomerInfo customerInfo = cartInfo.getCustomerInfo();
//		order.setCustomerName(customerInfo.getName());
//		order.setCustomerEmail(customerInfo.getEmail());
//		order.setCustomerPhone(customerInfo.getPhone());
//		order.setCustomerAddress(customerInfo.getAddress());
//
//		session.persist(order);
//
//		List<CartLineInfo> lines = cartInfo.getCartLines();
//
//		for (CartLineInfo line : lines) {
//			OrderDetail detail = new OrderDetail();
//			detail.setId(UUID.randomUUID().toString());
//			detail.setOrder(order);
//			detail.setAmount(line.getAmount());
//			detail.setPrice(line.getProductInfo().getPrice());
//			detail.setQuanity(line.getQuantity());
//
//			String code = line.getProductInfo().getCode();
//			Product product = this.productDAO.findProduct(code);
//			detail.setProduct(product);
//
//			session.persist(detail);
//		}
//
//		// Order Number!
//		cartInfo.setOrderNum(orderNum);
//		// Flush
//		session.flush();
//	}
//}
