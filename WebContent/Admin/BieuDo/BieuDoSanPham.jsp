<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
	
<!-- Mirrored from provide.smashingmagazine.com/graph_tut_files/ex_03.html?_ga=1.28962172.1909827855.1489493628 by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Mar 2017 12:44:53 GMT -->
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=1024">
		<title>Bảng đồ thể hiện tình trạng kho hàng</title>
		<link rel="stylesheet" href="../css/common.css">
		<link rel="stylesheet" href="../css/03.css">
	</head>
	<body>
		
		<div id="wrapper">
			<div class="chart">
				<h2>Biểu đồ thể hiện tình trạng kho hàng của các hãng sản xuất   </h2>
				
				<table id="data-table" border="1" cellpadding="10" cellspacing="0" summary="The effects of the zombie outbreak on the populations of endangered species from 2012 to 2016">
					<caption>(Đơn vị :VNĐ)</caption>
					<thead>
				<%ArrayList<BangTinhTrangKho> list=new BieuDoDAO().duLieuBang(); %>
						<tr>
							<td>&nbsp;</td>
							<th scope="col">Apple</th>
							<th scope="col">HTC</th>
							<th scope="col">Huawei</th>
							<th scope="col">LG</th>
							<th scope="col">Oppo</th>
						</tr>
						
					</thead>
					<tbody>
						<tr>
						<%for(int i=0;i<list.size()-2;i++){ %>
							<td><%out.print(list.get(i).getSoLuongXuat()); %></td>
							<%} %>
						</tr>
						<tr>
							<%for(int i=0;i<list.size()-2;i++){ %>
							<td><%out.print(list.get(i).getSoLuongBanDuoc());%></td>
							<%} %>
							
						</tr>
						<tr>
							<%for(int i=0;i<list.size()-2;i++){ %>
							<td><%out.print(list.get(i).getSoLuongChuaBanDuoc());%></td>
							<%} %>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- JavaScript at the bottom for fast page loading -->
		
		<!-- Grab jQuery from Google -->
		<script src="../jquery/jquery.min.js"></script>
		
		<!-- Example JavaScript -->
		<script src="../js/03.js"></script>
		
	</body>

<!-- Mirrored from provide.smashingmagazine.com/graph_tut_files/ex_03.html?_ga=1.28962172.1909827855.1489493628 by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Mar 2017 12:45:06 GMT -->
</html>