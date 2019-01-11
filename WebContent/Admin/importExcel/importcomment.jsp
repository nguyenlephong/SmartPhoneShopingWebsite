<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
 
  <script src="agu.js"></script>
  <script src="xlsx.js"></script>
  <script src="xlsx-model.js"></script>
  <script src="script.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      $('#btnExcel').on('click',function(event){
       var val = $('pre').text();
//          window.location.href('Excel?text='+val);
             $.post('../../Excel', {
  	                data : val,
             		action:'Comment'
  	        });
//          window.open(encodeURIComponent("Excel?text="+val));
      });
    });
  </script>
</head>

<body ng-app="xlsxApp" ng-controller="xlsxCtrl">
  <div class="container col-sm-10" style="float:left">
    <h5>Bạn chọn hoặc kéo thả file excel của bạn vào đây(Lưu ý:file excel phù hợp là file có những nội dung phù hợp bảng table đã có phía dưới,
    tức là có tên cột,có dữ liệu từng hàng,kiểu dữ liệu phù hợp,nếu dữ liệu lổi hệ thống sẽ loại bỏ những hàng lổi ra):
    Các bạn nhớ reload lại trang để xem cập nhật nhé.</h5>
    <div class="row">
      <div style="float:right;margin-left:10px">
           <button id="btnExcel" class="btn btn-success" name="file">Chọn file này</button>
        </div>
       <div style="float:right;margin-left:10px">
            <input type="file" class="form-control" xlsx-model="excel" multiple>
       </div>
         <pre ng-show="excel" class="hidden" >{{excel | json}}</pre>
    </div>
   
  </div>
  
</body>
</html>