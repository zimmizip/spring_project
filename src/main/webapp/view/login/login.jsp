<%@ include file ="/common/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
   <title>You Login Template</title>

   <!-- Google Font -->
   <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700" rel="stylesheet">
   <!-- Icon Font -->
   <link rel="stylesheet" href="<%=request.getContextPath() %>/fonts/ionicons/css/ionicons.css">
   <!-- Text Font -->
   <link rel="stylesheet" href="<%=request.getContextPath() %>/fonts/font.css">
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="<%=request.getContextPath() %>/csss/bootstrap.css">
   <!-- Normal style CSS -->
   <link rel="stylesheet" href="<%=request.getContextPath() %>/csss/style.css?ver=6">
   <!-- Normal media CSS -->
   <link rel="stylesheet" href="<%=request.getContextPath() %>/csss/media.css">
   
   
   
</head>

<body>
  <c:if test="${joincode eq '1'}">	<!-- 컨트롤러에 있음 --><!-- 회원가입 완료 후 페이지 이동시 alert 창 발생 -->
	
	<script>
		alert("회원 가입 되었습니다.");
	</script>
</c:if>

  <c:if test="${loginerror eq '1'}">							<!-- 입력한 id가 틀렸을때 -->
	
	<script>
		alert("입력하신 회원 ID가 존재하지 않습니다.");
	</script>
</c:if>

   
 <c:if test="${loginerror eq '2'}">							<!-- 입력한 id가 틀렸을때 -->
	
	<script>
		alert("비밀번호가 다릅니다. 다시 입력해주세요.");
	</script>
</c:if>

<c:if test="${deletecode eq '1'}">							<!-- 회원탈퇴후 로그인페이지이동시 alert창 -->
	
	<script>
		alert("탈퇴되셨습니다. 이용해 주셔서 감사합니다.");
	</script>
</c:if>

   <!-- Header start -->
   <div class="header-wrap">
      <div class="clearfix">
         <div class="logo">
            <a><b style="color: #555;">COM<span>워크</span></b></a>
         </div>

      </div>
   </div>
   <!-- Header end -->

<!-- 로그인 창 -->
<main class="cd-main">
      <section class="cd-section index visible ">
         <div class="cd-content style1">
            <div class="login-box d-md-flex align-items-center">
               <h1 class="title"> &nbsp;&nbsp;&nbsp;&nbsp;COM WORK</h1>
               <h3 class="subtitle">Let's perfect collaboration with COM Work</h3>
               <div class="login-form-box">
                  <div class="login-form-slider">
<!-- login slide start -->
                     <div class="login-slide slide login-style1">
                        
                        <form  id="loginForm"  method="post" action="<%=request.getContextPath()%>/login/login">
                           <div class="form-group"><br/><br/>
                           <fieldset>
                              <legend>로그인</legend> <hr/><br/>
                              <label class="label">Email</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" class="form-control" name="email" value="${email}">
                           </div>
                           <div class="form-group">
                              <label class="label">Password</label>
                              <input type="password" class="form-control" name="password" >
                           </div><br/>
                        
                           <div class="form-group">
                              <input type="submit" class="submit" value="로그인"> 
                           </div> 
                        </form><br/>
                        <div class="sign-up-txt">
                           Don't have an account? <a href="<%=request.getContextPath()%>/regist/join" class="sign-up-click">Sign Up</a>
                        </div>
                        <div class="forgot-txt">
                           Forgot your password? <a href="<%=request.getContextPath()%>/passwordCk/findpassword" class="forgot-password-click">Find PW</a>
                        </div>
                     </div>
                     <!-- login slide end -->
                     
                  </div>
               </div>
            </div>
         </div>
      </section>
   </main> 

<!-- JS File -->
   <script src="<%=request.getContextPath() %>/js/modernizr.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath() %>/js/popper.min.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
   <script src="<%=request.getContextPath() %>/js/velocity.min.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath() %>/js/script.js"></script>
   
</body>
</html>