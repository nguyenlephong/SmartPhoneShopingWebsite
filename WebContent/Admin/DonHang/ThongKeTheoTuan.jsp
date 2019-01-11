<%@page import="admin.model.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%			ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/DonHang/ThongKe.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Thống kê đơn hàng theo tuần</title>
	
   
</head>
<body class="">
  
              <div class="container">
                <div class="row">
                   <form id="tkweek" action="../../ThongKe?action=DonHangTheoTuan" method="post" id="thongke">
                     <div class="col-sm-3">
	                     <div class="form-group">
							  <label for="sel1" style="margin-top:10px" >Chọn tuần:</label>
							  <select class="form-control" id="sel1" name="week">
							    <option  value="1" title="Tuần 1" data-toggle="popover1" data-trigger="hover" data-content="Bao gồm những ngày từ ngày 1-7 của tháng ">Tuần 1</option>
							    <option  value="2" title="Tuần 2" data-toggle="popover2" data-trigger="hover" data-content="Bao gồm những ngày từ ngày 8-14 của tháng ">Tuần 2</option>
							    <option  value="3" title="Tuần 3" data-toggle="popover3" data-trigger="hover" data-content="Bao gồm những ngày từ ngày 15-21 của tháng ">Tuần 3</option>
							    <option  value="4" title="Tuần 4" data-toggle="popover4" data-trigger="hover" data-content="Bao gồm những ngày từ ngày 22 đến cuối tháng ">Tuần 4</option>
							  </select>
						</div>
                    </div>
                    <div class="col-sm-3" style="margin-top:10px">
                    	<label>Chọn tháng và năm</label>
                       <input type="month" name="startDate" id="chonthangtheotuan">
                        <p id="error-chonthangtheotuan"></p>
                    </div>
                    <div class="col-sm-3">
                        <button type="submit"  style="margin-top:43px" class="btn btn-dangger">Thống kê</button>
                    </div> 
					<div class="" style="float:right">
					<button class="btn btn-sm btn-danger "  style="margin-top:43px" data-toggle="modal" data-target="#bieudotuan">Xem biểu đồ</button>
					</div>
                   </form>
						<div class="modal fade" id="bieudotuan" role="dialog">
					    <div class="modal-dialog">
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title" style="text-align: center">Biểu đồ thống kê đơn hàng</h4>
					        </div>
					        <div class="modal-body">
					       <iframe src="../BieuDo/BieuDoDoanhThuDonHangTheoTuan.jsp" frameborder="0" width="100%" height="370px"></iframe>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
					        </div>
					      </div>
					      
					    </div>
					  </div>
                </div>
                <div class="row">
                    <div class=" col-sm-12">
                         <div class="panel panel-primary">
                         
                          <%
                          String test = (String) session.getAttribute("wd1");
                          String date = (String) session.getAttribute("week");
                          String text = (String) session.getAttribute("text");
                          if(test==null){
                        	  test="none";
                          }
                          if(test.equals("ok") ){
                          Map<String,DonHang> dh = new ThongKeDAO().getDonHangTheoTuan(date,text);

                          if(dh.size()!=0){
                          %>

                          <div class="panel-heading" style="text-align:center">Danh sách các đơn hàng</div>
                          <div class="panel-body ">
								 <table id="datatable-fixed-header" class="table table-striped table-bordered dataTable no-footer">
				                      <thead>
				                        <tr>
				                          <th>Mã đơn hàng</th>
				                          <th>Ngày đặt hàng</th>
				                          <th>Tên khách hàng</th>
				                          <th>Tên sản phẩm</th>
				                          <th>Tổng giá tiền (VNĐ)</th>
				                          <th>Số điện thoại</th>
				                          <th>Chi tiết</th>
				                        </tr>
				                      </thead>
				                      <tbody>
				                        <% for(DonHang d : dh.values()){ %>
				           				 <TR>
				               				 <TD> <%= d.getMaDonHang() %></td>
				               				 <TD> <%= d.getNgayGui() %></TD>
				               				 <TD> <%= d.getTenKhachHang()%></TD>
				              				  <TD> <%=d.getTenSanPham() %></TD>
				              				  <TD> <%= d.getTongSoTien() %></TD>
				              				  <TD> <%= d.getSdt() %></TD>
				                        	  
				                        	  <td><a href="ChiTietDonHang.jsp?id=<%=d.getMaDonHang()%>">
													<button type="button" class="btn btn-info" aria-label="Right Align">
														<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
													</button>
												</a>
											</td>
				           				 </TR>
				            <% } %>
				                      </tbody>
				                    </table>
						</div>
                          <%} }else{
                            	   Map<String,DonHang> donhang=new ThongKeDAO().getDonHangTheoTuanHeThong();
                          %>

                         <div class="panel-heading" style="text-align:center">Danh sách các đơn hàng của tuần này</div>
                          <div class="panel-body ">
								 <table id="datatable-buttons" class="table table-striped table-bordered">
				                      <thead>
				                        <tr>
				                          <th>Mã đơn hàng</th>
				                          <th>Ngày đặt hàng</th>
				                          <th>Tên khách hàng</th>
				                          <th>Tên sản phẩm</th>
				                          <th>Tổng giá tiền (VNĐ)</th>
				                          <th>Số điện thoại</th>
				                          <th>Chi tiết</th>
				                        </tr>
				                      </thead>
				                      <tbody>
				                        <% for(DonHang dhang : donhang.values()){ %>
				           				 <TR>
				               				 <TD> <%= dhang.getMaDonHang() %></td>
				               				 <TD> <%= dhang.getNgayGui() %></TD>
				               				 <TD> <%= dhang.getTenKhachHang()%></TD>
				              				  <TD> <%=dhang.getTenSanPham() %></TD>
				              				  <TD> <%= dhang.getTongSoTien() %></TD>
				              				  <TD> <%= dhang.getSdt() %></TD>
				                        	  <td><a href="ChiTietDonHang.jsp?id=<%=dhang.getMaDonHang()%>">
													<button type="button" class="btn btn-info" aria-label="Right Align">
														<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
													</button>
												</a>
											</td>
				           				 </TR>
				            <% } %>
				                      </tbody>
				                    </table>
						</div>
                          <%} %>
                        </div>
                    </div>
                </div>
				
            </div>
           
</body>
<!-- Script popover của lựa chọn tuần -->
		<script>
			$(document).ready(function(){
			    $('[data-toggle="popover1"]').popover();   
			});
			$(document).ready(function(){
			    $('[data-toggle="popover2"]').popover();   
			});
			$(document).ready(function(){
			    $('[data-toggle="popover3"]').popover();   
			});
			$(document).ready(function(){
			    $('[data-toggle="popover4"]').popover();   
			});
		</script>
</html>