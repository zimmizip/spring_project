<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file ="/common/header.jsp" %>
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
   <link rel="stylesheet" href="<%=request.getContextPath() %>/csss/style.css">
   <!-- Normal media CSS -->
   <link rel="stylesheet" href="<%=request.getContextPath() %>/csss/media.css">



    

</head>
<script>	/* 찾은 비밀번호 window open */
function chkfindpass() {
	var email = document.findform.email.value;
	var name = document.findform.name.value;
	
		
	window.open('<%=request.getContextPath()%>/passwordCk/password?name='+name+'&email='+email,'window팝업',
			'width=400, height=200, menubar=no, status=no, toolbar=no');
}


</script>
<body>



   <!-- Header start -->
   <div class="header-wrap">
      <div class="clearfix">
         <div class="logo">
            <a><b style="color: #555;">COM<span>워크</span></b></a>
         </div>
 
      </div>
   </div>
   <!-- Header end -->
   
   
   <main class="cd-main">
      <section class="cd-section index visible ">
         <div class="cd-content style1">
            <div class="login-box d-md-flex align-items-center">
               <h1 class="title"> &nbsp;&nbsp;&nbsp;&nbsp;COM WORK</h1>
               <h3 class="subtitle">Let's perfect collaboration with COM Work</h3>
               <div class="login-form-box">
                  <div class="login-form-slider">
                     
<!-- forgot password slide start -->
							<div class="forgot-password-slide slide login-style1">
								<div class="d-flex height-100-percentage">
									<div class="align-center width-100-percentage">
                                            <form action="<%=request.getContextPath()%>/passwordCk/findpassword" id="FindPwForm"  name="findform"  method="post">
                                            <div class="form-group"> <br/><br/>                                         
                                             <fieldset>
                                             <legend>PW 찾기</legend> <hr/><br/>
                                             <label class="label">Email</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             <input type="email" class="form-control" name="email" > <br/><br/>
											 <label class="label">Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											 <input type="text" class="form-control" name="name" > <br/><br/>
											 <!--  [${findpass}]===-->
											 <input type="submit" class="submit" value="찾기"  style="outline: none;" onclick="chkfindpass()">
											 	
												

												
                                             	
                                             </fieldset></div></form><br/>
                                             
                                             
                                             ${finderror }
										     <div class="sign-up-txt">
											if you remember your password? <a href="<%=request.getContextPath()%>/login/login" class="login-click">login</a>
										</div>
									</div>
								</div>
							</div>
<!-- forgot password slide end -->
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