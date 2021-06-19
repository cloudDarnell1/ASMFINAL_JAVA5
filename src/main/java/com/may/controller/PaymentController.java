package com.may.controller;

import com.may.constant.Constant;
import com.may.dao.OrderDAO;
import com.may.dao.ProductDAO;
import com.may.entity.*;
import com.may.service.MailerService;
import com.may.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/payment")
public class PaymentController {
	@Autowired
	SessionService sessionService;

	@Autowired
	private MailerService mailerService;

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private ProductDAO productDAO;

	// receive data from client.
	// client use js to send data
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public @ResponseBody ResponseDTO loginAuth(@RequestBody orderDTO order) throws MessagingException {

		// 1.get account logged in
		Account account = sessionService.get("login");

		// 2. create an order(receipt)
		Order receipt = new Order();
		receipt.setAccount(account);
		receipt.setAddress("Thao-May's house");

		// 3. create a list<OrderDetail>
		List<OrderDetail> orderDetails = new ArrayList<>();

		order.getListPurchased().forEach( x -> {
			OrderDetail orderDetail = x.convertToOrderDetail();
			orderDetail.setOrder(receipt);
			orderDetail.setProduct(productDAO.getById(Integer.parseInt(x.getId())));
			orderDetails.add(orderDetail);
		});

		// 4. add list of OrderDetail to order(receipt)
		receipt.setOrderDetails(orderDetails);

		// 5. store order to db
		Order save = orderDAO.save(receipt);

		// 6. send email to customer
//		mailerService.send(account.getEmail(), Constant.EMAIL_TITLE_PAYMENT, Constant.EMAIL_BODY_PAYMENT);

		return new ResponseDTO("thực hiện đặt hàng thanh cong mã don hang bang la ...",false);
	}
	
	@RequestMapping(value = "/CartDetail", method = RequestMethod.GET)
	public ModelAndView getCartDetailView(ModelAndView model) {
		model.setViewName( "user/CartDetail");
		Account ac = sessionService.get("login"); 
		if (ac == null) {
			model.setViewName("login");
			return model;
		}		
		return model;
	}
}
