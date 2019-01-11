<%@page import="admin.dao.HoiDapDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">

<!-- Mirrored from provide.smashingmagazine.com/graph_tut_files/ex_03.html?_ga=1.28962172.1909827855.1489493628 by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Mar 2017 12:44:53 GMT -->
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=1024">
	<title>Bảng đồ thể hiện tình trạng kho hàng</title>
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/03.css">
<link rel="stylesheet" href="css/BieuDoHD.css">
</head>
<body>
	<%HoiDapDAO dao = HoiDapDAO.getInstance(); %>
	<div id="wrapper">
		<div class="chart">
			<h2>Biểu đồ thể hiện tình trạng kho hàng của các hãng sản xuất   </h2>
			
			<table id="data-table" border="1" cellpadding="10" cellspacing="0" summary="The effects of the zombie outbreak on the populations of endangered species from 2012 to 2016">
				<caption>(Đơn vị :VNĐ)</caption>
				<thead>
					
					<tr>
						<td>&nbsp;</td>
						<th scope="col">Apple</th>
						<th scope="col">Samsung</th>
					</tr>
					
				</thead>
				<tbody>
					
					<tr>
						<th ssope = "row " > Câu Hỏi đã Trả Lời  </th>
						<td><%= dao.soCauTraLoiIP*35 %></td>
						<td><%= dao.soCauTraLoiSSung*35 %></td>
						
					</tr>
					<tr>
						<th ssope = "row " > Câu Hỏi Chưa Trả Lời  </th>
						<td><%= dao.soCauChuaTraLoiIP*35 %></td>
						<td><%= dao.soCauChuaTraLoiSSung*35 %></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- JavaScript at the bottom for fast page loading -->
	
	<!-- Grab jQuery from Google -->
	<script src="jquery/jquery.min.js"></script>
	
	<!-- Example JavaScript -->
	<script src="js/03.js"></script>
	
</body>

<!-- Mirrored from provide.smashingmagazine.com/graph_tut_files/ex_03.html?_ga=1.28962172.1909827855.1489493628 by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Mar 2017 12:45:06 GMT -->
</html>