<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script>
function todo(){
   var content = $("#content").val();
   
   $.ajax({
      type : "POST",
      url : "<%=request.getContextPath()%>/todo/todo_make",
      data : {"content" : content},
      success : function(data){
         opener.parent.location.reload();
         self.close();
      }
   });
}
</script>
<style>
@media (min-width: 768px)
.col-sm-6 {
    width: 50%;
}
@media (min-width: 768px)
.col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9 {
    float: left;
}

.document {
    margin-top: -19px;
    margin-left: -8px;
    width: 96%;
    position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}
textarea#content {
    height: 116px;
    width: 98.4%;
    margin: 0px 0.4px 0px 0px;
}
button.document-btn {
    margin-top: 6px;
    background-color: #3c4d6d;
    color: white;
    font-size: initial;
}
input#title {
    width: 94.4%;
    margin-bottom: 16px;
    height: 27px;
}
form {
    margin-top: 48px;
}
h3 {
    padding-top: 25px;
    text-align: center;
}
.form-send {
    text-align: center;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body >
<div class="document" style="height: 80px; background-color: rgb(0, 51, 102);color: white;">
   <div class="col-lg-6 col-md-6 col-sm-6">
           <h3><span class="material-icons">content_paste</span>&nbsp;&nbsp;할 일 추가</h3>
            <div id="message"></div>
            <form name="documentFrm" role="form" action="contactform/contactform.php" method="POST">

              <div class="form-group">
                <textarea class="form-control" id="content"  placeholder="내용을 입력하세요" rows="5" data-rule="required" data-msg="Please write something for us"></textarea>
                <div class="validate"></div>
              </div>

              <div class="form-send">
                <button type="button" style="background-color: rgb(0, 51, 102); "class="document-btn" onclick="todo();">추가하기</button>
              </div>

            </form>
          </div>
</body>
</html>