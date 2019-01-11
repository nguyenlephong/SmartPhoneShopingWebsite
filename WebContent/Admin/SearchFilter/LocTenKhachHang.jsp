<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
		<%
			ServletContext contextChucNang = getServletContext();
			contextChucNang.setAttribute("chucNang", "LocTheoTen"); 
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
      <%KhachHang kh =(KhachHang)session.getAttribute("KhachHang");
      String disable="";
      		if(kh!=null){
      			ServletContext contextDisable = getServletContext();
      			disable=(String) contextDisable.getAttribute("disabledButton");
      			if(disable==null){
      				disable="";
      			}
      	}
      %>
      
	<form action="../Search" method="post">
		<input type="text" list="tenKH" <%=disable %> id="fname" name="email" onchange=""/>
		<button class="btn btn-success btn-sm" type="submit"><span class="glyphicon glyphicon-search"></span>  Tìm</button>
	</form>
	
	<%ArrayList<KhachHang> list = new KhachHangDAO().getDanhSachKhachHang(); %>
	<datalist id="tenKH">
	<%for(int i=0;i<list.size();i++){ %>
		<option value="<%=list.get(i).getEmail()%>"><%=list.get(i).getName()%></option>
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