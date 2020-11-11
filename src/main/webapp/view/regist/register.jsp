<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
   
   	<!-- 이메일인증 -->
   <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- ajax -->
   <script src="http://code.jquery.com/jquery-1.7.js"></script>
   <script type = "text/javascript">
   
   

  /*  email 인증 */
  
   	  var code;	//ajax 결과값을 저장하기 위한 변수
   	  function emailcheck(){
   		 var email = $('#email').val();
   		  
   		 $.ajax({
             type: "POST",
             url: "<%=request.getContextPath()%>/regist/idCheck",
             async: false,
             data:{email: email},
             success: function(result) {
             	if(result == 1){
             		authCode();
             	}else if(result == 0){
             		 alert("중복된 아이디 입니다.");
             	}else{
             		alert("틀렸다");
             	}
             },error: function(e) {
             	alert("오류");
             }
          });
   	  }
   	  
      function authCode() {			//메일 보내주는 함수
         var email = $('#email').val();
            
         alert("인증번호가 전송 되었습니다.");
         show();
         $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/regist/emailRegisterCheckServlet",
            async: false,
            data:{email: email},
            success: function(result) {
            	code = result;
            },error: function(e) {
            	alert("오류");
            }
         });
      }
      
      function show() {
    	  $('#authCheck').show();
      }
      
      
      function checkAuthCode() {
    	  var Authcode = $('#checkcode').val();
    	  if(Authcode.length == 6){
    		  if(code.indexOf(Authcode) != -1) {
        		  $('#checkcode').attr('disabled', true);
        		  $('#checkcode').val("인증완료");
        		 /*  $('#authCheck').hide(); */
        		  /* $('#checkResult').show(); */
        	  } else {
        		  alert("인증번호를 확인해주세요.");
        	  }
    	  }else{
    		  alert("인증번호를 확인해주세요.");
    	  }
      }
      
      
      	/* ajax */
      	/* 이름을 올바르게 입력하지 않았을 경우 메세지 출력 */
      	function nameCheckFunction() {
      		var reg_name = /^[가-힣a-zA-Z]+$/;
      		if(reg_name.test($('#name').val()) == false || $("#name").val() == "") {
      			$('#nameCheckMessage').html('이름을 정확히 입력해주세요.');
      		}
      		else if ($("#name").val().length <= 1 || $("#name").val().length > 3) {
      			$('#nameCheckMessage').html('이름의 길이를 확인해주세요.');
      		}
      		else {
      			$('#nameCheckMessage').html('');
      		}
      	}

      /* 	이메일을 올바르게 입력하지 않았을 경우 메세지 출력 형식 확인 */
      	function emailCheckFunction() {
      		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
      		if(reg_email.test($('#email').val()) == false) {
      			$('#emailCheckMessage').html('이메일 형식이 올바르지 않습니다.');
      		}
      		else {
      			$('#emailCheckMessage').html('');
      		}
      	}
      	
      	/* 비밀번호가 서로 일치 하지 않을 때 메세지 출력 */
      	function passwordCheckFunction() {
      		var userPassword1 = $('#password').val();
      		var userPassword2 = $('#repassword').val();
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
      	
      	function Frmsubmit(){
      		var result = $('#checkcode').val();
      		if(result == "인증완료"){
      			$("#memberForm").submit();
      		}else{
      			alert("이메일 인증을 완료하십시오");
      		}
      	}
      </script>	
</head>
<style>
input#checkcode {
    margin-top: 24px;
}
</style>
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
                     
<!-- 회원가입 창 -->
                     <div class="signup-slide slide login-style1">
                        <div class="d-flex height-100-percentage">
                           <div class="align-self-center width-100-percentage">
                              <form action="<%=request.getContextPath()%>/regist/join" id="memberForm"  method="post">
                                 <div class="form-group">
                                 <fieldset>
                                            <legend>회원가입</legend> <hr/><br/>
                                    <label class="label">Name&nbsp;&nbsp;</label>
                                   <span> <input type="text" style="margin-top: -6px;" class="form-control" name="name" id="name" value="${ name}" placeholder="이름 입력" onkeyup="nameCheckFunction()"></span>
                                   
                                    &emsp;&emsp;&emsp;<h6 style = "font-size:12px; color : red;margin-left: 27px;text-align: center;margin-top: -21px; margin-bottom: -9px;" id="nameCheckMessage"></h6>
                                 </div>
                                 <div class="form-group" id="email_form_group">
                                    <label class="label"><span>Email&nbsp;&nbsp;</span></label>
                                    <span><input style="margin-bottom: 14px;"type="email" class="form-control" name="email" id="email" placeholder="예)abc@naver.com" onkeyup="emailCheckFunction()"></span>
                                    <span><input type="button" class="citation" value="인증" id = "btnEmail"  onclick = "emailcheck()"></span>
                                    <h6 style = " font-size:12px; color : red; margin-bottom: -22px;margin-top: -3px;margin-left: 29px;text-align: center;" id="emailCheckMessage" ></h6>
                                     
                                     <!-- 인증코드 입력 -->
                                     <div class="form-group" id = "authCheck" style = "display: none">
	   								<label class="label">CODE&nbsp;&nbsp;</label>
									<span><input type = "text" class="form-control" placeholder = "CODE 입력" id = "checkcode"><span>
	   								<span><input type = "button" class="citation" value = "확인" onclick = "checkAuthCode()"><span>
  								 	</div>
   									
                                    <!-- <label class="label">Code</label> -->
                                    <!-- mail인증완료 -->
                                    <p>
                                    <!-- <div class="form-group" id = "checkResult" style = "display: none">
   									<h6 style = "color: blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인증 완료!</h4>
  									 </div> -->
  									 
                                 </div>
                                 <div class="form-group">
                                    <label class="label">Pwd&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <input  style="margin-top: 11px;margin-bottom: 4px;"type="password" class="form-control" name="password" id="password" placeholder="비밀번호 입력" >
                                 </div>
                                 <div class="form-group">
                                    <label class="label">RePwd</label>
                                    <input  style="margin-left: 3px;margin-top: 3px;"type="password" class="form-control" name="repassword" id="repassword" placeholder="비밀번호 재입력" onkeyup="passwordCheckFunction();"><br>
                                 	<h6 style = "margin-top: 8px;text-align: center;font-size: 12px;color: red;margin-left: 30px;" id="passwordCheckMessage" ></h6>
                                 </div>
                                 <div class="form-group padding-top-15px">
                                    <input type="button" class="submit" value="Sign Up" style="outline: none;" onclick="Frmsubmit()">
                                 </div>
                              </form>
                              <div class="sign-up-txt">
                                 if you have an account? <a href="<%=request.getContextPath()%>/login/login" class="login-click">login</a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <!-- signup slide end -->
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