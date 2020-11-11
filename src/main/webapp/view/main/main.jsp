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
   href="<%=request.getContextPath()%>/lib/bootstrap/css/bootstrap.min.css?ver=6"
   rel="stylesheet">
<!--external css-->
<link
   href="<%=request.getContextPath()%>/lib/font-awesome/css/font-awesome.css"
   rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/style.css?ver=3"
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
   location.href="<%=request.getContextPath()%>/login/login";
}
function todo(){
	var _left = Math.ceil(( window.screen.width - 500 )/2);
    var _top = Math.ceil(( window.screen.width-800 - 500 )/2); 
	window.open("<%=request.getContextPath()%>/todo/todo", "할 일 추가", "width=403, height=273 left= " + _left + ", top=" + _top );
}
function todo_del(frm){
	var delConfirm = confirm('삭제 하시겠습니까?');
	if (delConfirm) {
		   $.ajax({
			      type : "POST",
			      url : "<%=request.getContextPath()%>/todo/todo_del",
			      data : {"num" : frm.todoNum.value},
			      success : function(data){
		     	 			       
			      }
		   });
	   }
	   else {
	      alert('삭제가 취소되었습니다.');
	  }
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
    font-size: 1px;
    -webkit-border-radius: 4px;
    border: 1px solid #e3eaea !important;
    padding: 6px 14px;     
    margin-left: 5px;
      
}
.tasks-widget .task-list li > .task-title {
    overflow: hidden;
    margin-right: 10px;
    display: flex;
    align-items: center;
}
.btn-group-xs>.btn, .btn-xs {
    padding: 1px 5px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
    position: absolute;
    right: %;
    left: 89%;
}
.trash {
    display: flex;
    align-items: center;
}

</style>
<body>
   <%
      session.removeAttribute("workspace_name");
   %>
   <c:if test="${modifycode eq '1'}">                            <!-- 회원정보 수정 완료 후 페이지 이동시 alert 창 발생 -->
	    <script>
	        alert("회원 정보 수정 되었습니다.");
	    </script>
	</c:if>
   <section id="container">
      <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header main-bg" style="background-color: #003366">
         <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right"
               data-original-title="메뉴 접기"></div>
         </div>
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
      <aside>
         <div id="sidebar" class="nav-collapse"
            style="background-color: #003366; height:99vh;position: fixed; border-radius: 30px 30px;">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion" style="display: block; margin-top:124px; margin-left: 16px;">
                <li class="mt">
           			<a  href="javascript:AttendWorkspace();"> 
           			 <i class="fa fa-plus-square" aria-hidden="true"></i>
              		<span>워크 스페이스 참가</span>
              		</a>
          	   </li>
          	   <li class="mt">
           			<a  href="javascript:MakeWorkspace();"> 
           			 <i class="fa fa-plus-square-o" aria-hidden="true"></i>
              		<span>워크 스페이스 생성</span>
              		</a>
          	   </li>
          	   <li class="mt">
           			<a  href="${pageContext.request.contextPath}/view/main/modify.jsp;"> 
              		<i class="fa fa-male" aria-hidden="true"></i>
              		<span>회원 정보 수정</span>
              		</a>
          	   </li>
          	   <li class="mt">
           			<a  href="javascript:logout();"> 
           			<i class="fa fa-sign-out" aria-hidden="true"></i>
              		<span>로그아웃</span>
              		</a>
          	   </li>
            </ul>
            <!--사이드바 메뉴 끝-->
         </div>
      </aside>
      <!--sidebar end-->
      <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
      <!--내용헤드-->
      <section id="main-content">
         <section class="wrapper">
            <h3>
               <i class="fa fa-angle-right"></i>Main Page
            </h3>

         </section>
         <!-- /wrapper -->
      </section>
      <!-- 내용헤드  끝-->
      <!--채팅 시작-->
      <div>
         <hr>
      </div>
      <section id="wrapper">
         <section id="main-content">
            <div class="col-lg-6 col-md-6 col-sm-12">
               <!--  ALERTS EXAMPLES -->
               <div class="showback">
                  <div>
                     <h4>
                        <span class="material-icons">preview</span> 워크스페이스 목록
                     </h4>
                    
                  </div>
                  <c:forEach var="workspace" items="${workspaceList}">
                     <div class="alert alert-info">
                     <a href="../main/workspace_main?workspace_name=${workspace.WORKSPACE_NAME }">
                        <b>WorkSpace</b> <strong>
                           ${workspace.WORKSPACE_NAME }</a>&nbsp;&nbsp;&nbsp;[${workspace.COUNT }] </strong>
                     </div>
                  </c:forEach>
               </div>
               <!-- /showback -->
            </div>
         </section>
         <!--채팅 end-->

         <!-- 워크스페이스 시작 -->
         <section id="main-content">
  		 		<div class="col-md-12">
            <section class="task-panel tasks-widget">
              <div class="panel-heading">
                <div class="pull-left">
                  <h5><i class="fa fa-tasks"></i> Todo List </h5>
                </div>
                <br>
              </div>
              <div class="panel-body">
                <div class="task-content">
                  <ul class="task-list">
                   <c:forEach var="todo" items="${todoList}">
                    <li style="word-break: break-all;">
                      <div class="task-title"><i class="fa fa-caret-right"></i>
                      <div class="content" style = "max-width: 414px; display: inline-block; margin-left: 19px;"> 
                        <span class="task-title-sp">${todo.content }</span></div>
                        <div class="pull-right hidden-phone">
                        <form>
                        <div class="trash">
                          <button class="btn btn-danger btn-xs" onclick="todo_del(this.form);"><i class="fa fa-trash-o "></i></button>
                          </div>
                          <input type="hidden" value="${todo.num }" id="todoNum">
                        </form>
                        </div>
                      </div>                   
                    </li>       
                     </c:forEach>
                  </ul>                 
                </div>
                <div class=" add-task-row">
                  <a class="btn btn-success btn-sm pull-right" href="javascript:todo();">Add New Tasks</a>
                </div>
              </div>
            </section>
          </div>
         </section>
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