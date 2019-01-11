<%@page import="model.ChiTietDonHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi tiết đơn hàng của bạn</title>
</head>
<body>
	<%String user=request.getParameter("user"); %>
	<%ChiTietDonHang chiTietDonHang=(ChiTietDonHang) session.getAttribute("chitietdonhang"+user); %>
	<%out.print(chiTietDonHang); %>
	<a href="index.jsp">Tiếp tục mua hàng</a>
</body>
</html>