<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en" style="height: 100%">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
   content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>쌍용워크 메인화면</title>

<!-- Favicons -->
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="<%=request.getContextPath()%>/img/favicon.png" rel="icon">
<link href="<%=request.getContextPath()%>/img/apple-touch-icon.png"
   rel="apple-touch-icon">

<!-- Bootstrap core CSS -->
<link
   href="<%=request.getContextPath()%>/lib/bootstrap/css/bootstrap.min.css?ver=2"
   rel="stylesheet">
<!--external css-->
<link
   href="<%=request.getContextPath()%>/lib/font-awesome/css/font-awesome.css"
   rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/style.css?ver=6"
   rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style-responsive.css"
   rel="stylesheet">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/to-do.css">

</head>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script type="text/javascript">
function MakeWorkspace(){
   var _left = Math.ceil(( window.screen.width - 500 )/2);
    var _top = Math.ceil(( window.screen.width-800 - 500 )/2); 
    window.open("../workspace_make/make_workspace", "워크스페이스 생성", "width=500, height=200 left= " + _left + ", top=" + _top );   
}
function AttendWorkspace(){
   var _left = Math.ceil(( window.screen.width - 500 )/2);
    var _top = Math.ceil(( window.screen.width-800 - 500 )/2); 
    window.open("../workspace_attend/attend_workspace", "워크스페이스 참가", "width=525, height=200 left= " + _left + ", top=" + _top );   
}
function logout(){
   sessionStorage.clear();
   location.href="<%=request.getContextPath()%>/view/login/login.jsp";
   }
   
   
/* ajax */
   /* 이름을 올바르게 입력하지 않았을 경우 메세지 출력 */
   function nameCheckFunction() {
      var reg_name = /^[가-힣a-zA-Z0-9]+$/;
      if(reg_name.test($('#name_modify').val()) == false || $("#name").val() == "") {
         $('#nameCheckMessage').html('이름을 정확히 입력해주세요.');
      }
      else if ($("#name_modify").val().length <= 1 || $("#name_modify").val().length > 6) {
         $('#nameCheckMessage').html('6자리까지 입력가능합니다.');
      }
      else {
         $('#nameCheckMessage').html('');
      }
   }


   
   /* 비밀번호가 서로 일치 하지 않을 때 메세지 출력 */
   function passwordCheckFunction() {
      var userPassword1 = $('#password_modify').val();
      var userPassword2 = $('#repassword_modify').val();
      if(userPassword1 != userPassword2) {
         $('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
      }
      else {
         $('#passwordCheckMessage').html('');
      }
   }
   
   /* alert팝업창 오류메세지 알림창 구현 */
    $(function() {
      var responseMessage = "<c:out value="${ErrorMessage}"/>";
      if(responseMessage != "") {
         alert(responseMessage);
      }
   }) 
</script>
<style>
.alert-info {
   color: #31708f;
   background-color: #e3e6f7;
   border-color: #7475ad;
}

.btn-success.active.focus, .btn-success.active:focus, .btn-success.active:hover,
   .btn-success:active.focus, .btn-success:active:focus, .btn-success:active:hover,
   .open>.dropdown-toggle.btn-success.focus, .open>.dropdown-toggle.btn-success:focus,
   .open>.dropdown-toggle.btn-success:hover {
   color: #fff;
   background-color: #244671;
   border-color: #244671;
}

.showback {
   background: #ffffff;
   padding: 15px;
   margin-bottom: 15px;
   box-shadow: 2px 3px 2px #aab2bd;
}

::selection {
   background: #eaeaea;
   color: #201c5a;
}

hr {
   margin-top: 20px;
   margin-bottom: 20px;
   border: 0;
   border-top: 1px solid #797979;
}

.buttons {
   margin-bottom: 15px;
}

.btn-success {
   color: #fff;
   background-color: #244671;
   border-color: #535a82;
}

.btn-success:hover {
   color: #fff;
   background-color: #244671;
   border-color: #244671;
}

.btn-success.focus, .btn-success:focus {
   color: #fff;
   background-color: #244671;
   border-color: #244671;
}

li.friendlist {
   text-align: center;
   color: white;
}

.btn-success.active, .btn-success:active, .open>.dropdown-toggle.btn-success
   {
   color: #fff;
   background-color: #244671;
   border-color: #535a82;
}
input[type="button"] , input[type="submit"] {
    color: #f2f2f2;
        background: #003366;
    -webkit-border-radius: 4px;
    border: 1px solid #e3eaea !important;
    padding: 6px 14px;     
    margin-left: 5px;}
      
#main-content {
    margin-left: 0px;
}

</style>
<body>
   <%
      session.removeAttribute("workspace_name");
   %>
   <section id="container">
      <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header main-bg" style="background-color: #003366">
      
         <!--logo start-->
         <a class="logo"><b>COM<span>워크</span></b></a>
         <!--logo end-->

         <div class="top-menu">
            <ul class="nav pull-right top-menu">
               <li
                  style="color: white; margin-top: 16px; margin-right: 30px; font-size: 20px">${name }님</li>
               
            </ul>
         </div>
      </header>
      <!--header end -->

      <!--사이드바 시작-->
      
      <!--sidebar end-->
      <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->

      <!--회원정보 수정 시작-->
      <div>
         <hr>
      </div>
      <div class="modify">
      <section id="wrapper">
         <section id="main-content" style="margin-top:5%;">
      <br>
         <h2 class="text-center">회원 정보 수정</h2><br><br>
         <div style="margin:auto; margin-bottom: 50px; width: 20%;">
          
               <form action="${pageContext.request.contextPath}/membermodify/membermodify"  method="post">
                  <div class="row" >
                  
 
                        <div class="form-group">
                     <h5>&nbsp;&nbsp;&nbsp;이메일 : </h5>     <input type="text" id ="email" name="email" readonly="readonly" class="form-control"  value="${email}"  style="width:100%;">
                        </div>
                     

                        <div class="form-group">
                  <h5>   &nbsp;&nbsp;&nbsp;현재 이름 : </h5>      <input type="text" id ="name" name="name" readonly="readonly" class="form-control"  value="${name}"  style="width:100%;">
                        </div>

                     

                        <div class="form-group">
                  <h5>  &nbsp;&nbsp;&nbsp;변경할 이름 : </h5>        <input type="text" id = "name_modify" name="name_modify" class="form-control" placeholder="변경할 이름 입력" value="${name_modify}" onkeyup="nameCheckFunction()" style="width:100%;">
                           &nbsp;&nbsp;&nbsp;<h6 style = " font-size:12px; color : red;" id="nameCheckMessage"></h6>
                        </div>

                     

                        <div class="form-group">
                       <h5>&nbsp;&nbsp;&nbsp;현재 비밀번호 :  </h5>   <h6 style="font-siz:12px; color : red;">&nbsp;&nbsp;&nbsp;* 필수입력  </h6>
                               
                         <input type="password" id = "password" name="password" class="form-control" placeholder="현재 비밀번호 입력" style="width:100%;">
                        </div> 

                     

                        <div class="form-group">
                     <h5>   &nbsp;&nbsp;&nbsp;변경할 비밀번호 :  </h5>    <input type="password" id = "password_modify" name="password_modify" class="form-control" placeholder="변경할 비밀번호 입력" style="width:100%;">
                        </div> 

                     
                        <div class="form-group">
                       <h5>  &nbsp;&nbsp;&nbsp;변경할 비밀번호 재입력 :  </h5>  <input type="password" id = "repassword_modify" name="repassword_modify" class="form-control" placeholder="비밀번호 재입력" style="width:100%;" onkeyup="passwordCheckFunction();">
                           <h6 style = " font-size:12px; color : red;" id="passwordCheckMessage" ></h6>
                        </div> 
                      
                     
                     <div style="margin-left: auto;  margin-right: auto; margin-top: 20px; text-align: center;">
                        <div class="buttons">
                        
                        <input type="submit" value="수정하기" class="btn btn-round btn-success">                    
                     <input type="button" value="돌아가기" class="btn btn-round btn-success" 
                        onclick="location.href='${pageContext.request.contextPath}/main/main'">
                        </div>
                     </div>
                  </div>
               </form>     
            </div>
   </section>
</section>
</div>
<!--회원정보 수정 end-->

   <!-- js placed at the end of the document so the pages load faster -->
   <script src="<%=request.getContextPath()%>/lib/jquery/jquery.min.js"></script>
   <script
      src="<%=request.getContextPath()%>/lib/bootstrap/js/bootstrap.min.js"></script>
   <script class="include" type="text/javascript"
      src="<%=request.getContextPath()%>/lib/jquery.dcjqaccordion.2.7.js"></script>
   <script
      src="<%=request.getContextPath()%>/lib/jquery.scrollTo.min.js"></script>
   <script src="<%=request.getContextPath()%>/lib/jquery.nicescroll.js"
      type="text/javascript"></script>
   <!--common script for all pages-->
   <script src="<%=request.getContextPath()%>/lib/common-scripts.js"></script>
   <!--script for this page-->
   <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
   <script src="<%=request.getContextPath()%>/lib/tasks.js"
      type="text/javascript"></script>
   <script>
      jQuery(document).ready(function() {
         TaskList.initTaskWidget();
      });

      $(function() {
         $("#sortable").sortable();
         $("#sortable").disableSelection();
      });
   </script>

</body>

</html>

