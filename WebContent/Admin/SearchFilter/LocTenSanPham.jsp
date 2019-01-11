<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
		<%
			ServletContext contextChucNang = getServletContext();
			contextChucNang.setAttribute("chucNang", "LocTheoTenSanPham"); 
		%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.7.1/modernizr.min.js"></script>

<script>

// Safari reports success of list attribute, so doing ghetto detection instead
yepnope({
  test : (!Modernizr.input.list || (parseInt($.browser.version) > 400)),
  yep : [
      'https://raw2.github.com/CSS-Tricks/Relevant-Dropdowns/master/js/jquery.relevant-dropdown.js',
      'https://raw2.github.com/CSS-Tricks/Relevant-Dropdowns/master/js/load-fallbacks.js'
  ]
});
</script>
</head>
<body>
	<form action="../Search" method="post">
		<input type="text" list="tenSP" id="fname" name="masp" onchange=""/>
		<label><strong>Nhập số lượng:</strong></label><input type="number" name="slmua">
		<button class="btn btn-success btn-sm" type="submit"><span class="glyphicon glyphicon-shopping-cart"></span>   Đặt sản phẩm</button>
		
	</form>
	<%//ArrayList<SanPham> list = new SanPhamDAO().getAllSanPham(); 
		Map<String,String>  listDanhSach = new SanPhamDAO().getFindName();
	%>
	<datalist id="tenSP">
	<%//for(int i=0;i<list.size();i++){ %>
	<%for(Map.Entry<String,String> a: listDanhSach.entrySet()){ %>
		<option value="<%=a.getKey()%>"><%=a.getValue()%></option>
		<%} %>
	</datalist>
</body>
<script type="text/javascript" >
	function xuLyLocTheoHo(){
		var ho = document.getElementById("fname").value;
          window.location.href = '../XuLyLocTheoHo?ho=' + document.getElementById('fname').value;
	}
</script>
</html>