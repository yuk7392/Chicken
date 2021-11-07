package com.chicken.view;

import java.util.HashMap;
import java.util.Map;

import com.chicken.view.board.*;
import com.chicken.view.user.*;



public class HandlerMapping {
	private Map<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/userManager_delete.do", new deleteUserController());
		mappings.put("/userManager_getInfo.do", new getUserInfoController());	
		mappings.put("/login.do", new LoginController());	
		mappings.put("/logout.do", new LogoutController());	
		mappings.put("/mypage.do", new MypageViewController());	
		mappings.put("/signup.do", new signupController());	

		mappings.put("/userManager_update_.do", new updateUserController());	
		mappings.put("/userupdate.do", new UserUpdateController());	
		mappings.put("/list.do", new NoticeController());	
		mappings.put("/order.do", new OrderController());
		mappings.put("/pagebefore.do", new pagebeforeController());	
		mappings.put("/pageafter.do", new pageafterController());
		mappings.put("/pagenum.do", new pageNumberController());
		
		mappings.put("/addBoard.do", new addBoardController());
		mappings.put("/addProduct.do", new addProductController());
		mappings.put("/deleteBoard.do", new deleteBoardController());
		mappings.put("/updateBoard.do", new updateBoardController());
		mappings.put("/updateProduct.do", new updateProductController());
		mappings.put("/deleteProduct.do", new deleteProductController());
		mappings.put("/updateOrder.do", new updateOrderController());
		mappings.put("/deleteOrder.do", new deleteOrderController());
		mappings.put("/updateService.do", new updateServiceController());
		mappings.put("/deleteService.do", new deleteServiceController());

		mappings.put("/reviewWrite.do", new reviewWriteController());
		mappings.put("/serviceWrite.do", new serviceWriteController());
		mappings.put("/postRead.do", new boardReadController());
		mappings.put("/reviewUpdate.do",new reviewUpdateController());
		mappings.put("/serviceUpdate.do",new serviceUpdateController());
		mappings.put("/rsDelete.do", new rsDeleteController());
		
		mappings.put("/cancleOrder.do", new cancleOrderController());
		mappings.put("/cart.do",new cartGetUserController());
		mappings.put("/payment.do",new addOrderController());
		mappings.put("/thumbsButton.do", new thumbsController());
		mappings.put("/menuList.do", new menuListController());
		mappings.put("/orderButton.do", new orderButtonController());
		mappings.put("/addCart.do", new addCartController());
		mappings.put("/removeCart.do", new removeCartController());
		
	}

	public Controller getController(String path) {
		return mappings.get(path);
	}
}

