<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chicken.board.productDto"%>
<meta charset="UTF-8">
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");

productDto pDto = (productDto)session.getAttribute("productInfo");


String Qnt = request.getParameter("quantity");
String id = request.getParameter("id");


String Pid = pDto.getId();
String Pname = pDto.getName();
int Price = pDto.getPrice();
String Des = pDto.getDesc();

session.setAttribute("Cname",Pname);
session.setAttribute("Cid",Pid);
session.setAttribute("CPrice",Price);
session.setAttribute("Cdes",Des);
session.setAttribute("Cqnt",Qnt);

response.sendRedirect("./addCart.do?productId="+Pid);

		%>