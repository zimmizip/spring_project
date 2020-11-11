<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    margin-left: 5px;
      
}
#main-content {
    margin-left: 0px;
}

</style>
<body>
   <%
      session.removeAttribute("workspace_name");
   %>
<c:if test="${deletecode eq '2'}">                     <!-- 비밀번호 틀렸을때 -->
   
   <script>
      alert("비밀번호가 틀렸습니다.");
   </script>
</c:if>

   
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

      
      <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
      
      <div>
         <hr>
      </div>
      <section id="wrapper">
         <section id="main-content" style="margin-top:7%;">

            
            
         <br><br><br><br>
         <h2 class="text-center">회원 탈퇴</h2><br><br>
          
          
         <div style="margin:auto; margin-bottom: 50px; width: 20%; text-align: center;" >
               <form action="${pageContext.request.contextPath}/memberdelete/memberdelete" method="post" >
                  <div class="row" >
                  
                   
                        <div class="form-group">
                           <input type="text" id ="email" name="email" readonly="readonly" class="form-control"  value="${email}" style="width:80%;">
                        </div>
                   
                     
                    
                        <div class="form-group">
                           <input type="password" id = "password" name="password" class="form-control" placeholder="비밀번호 입력" style="width:80%;">
                        </div> 
                    
                     
                     <div style="margin-left: auto;  margin-right: auto; margin-top: 20px; text-align: center;">
                        <div class="buttons">
                        <input type="submit" value="탈퇴하기" class="btn btn-round btn-success">
                        <input type="button" value="돌아가기" class="btn btn-round btn-success" 
                        onclick="location.href='${pageContext.request.contextPath}/main/main'">
                        </div>
                     </div>
                  </div>
               </form>     
            </div>
   
      
      </section>
   </section>
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




