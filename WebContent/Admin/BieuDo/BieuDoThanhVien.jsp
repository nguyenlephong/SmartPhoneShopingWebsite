<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.ServletContext"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer", {
    	<%ServletContext context = getServletContext();
			String iduser = (String) context.getAttribute("iduser");
			if (iduser == null || iduser.equals("5")) {
				iduser = "1";
			}%>
      title:{
        text: "Biểu đồ thể hiện điểm số các môn học chuyên ngành"              
      },
      data: [//array of dataSeries              
        { //dataSeries object

         /*** Change type "column" to "bar", "area", "line" or "pie"***/
         	<%ArrayList<BangDiem> list = new BieuDoDAO().duLieuBangDiem(iduser);%>
         type: "column",
         dataPoints: [
        	<%for (int i = 0; i < list.size()-1; i++) {%>
         { label: "<%out.print(list.get(i).getMon());%>", y: <%=Integer.parseInt(list.get(i).getDiem())%> },
        	<%}%>
       
         { label: "<%out.print(list.get(list.size()-1).getMon());%>", y: <%=Integer.parseInt(list.get(list.size()-1).getDiem())%> }
         ]
       }
       ]
     });

    chart.render();
  }
  </script>
<script type="text/javascript"
	src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>
	<div id="chartContainer" style="height: 300px; width: 100%;"></div>
</body>
</html>
