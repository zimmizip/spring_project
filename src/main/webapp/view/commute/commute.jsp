<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script>
function popupFormselfCloseSubmit(){
   var type = $("#type1").val();         /*  출근  */
   
   $.ajax({
      type : "POST",
      url : "<%=request.getContextPath()%>/commute/comm",
      data : {"type" : type},       
      success : function(data){ 
         alert(data);
         self.close();
      }   
   });
}

function popupFormselftCloseSubmit2(){
	  var button1 = document.getElementById("gowork"); 
	   var button2 = document.getElementById("offwork");
	   var button1Default, button2Default;
	   button1Default = button1.style.backgroundColor;
	   button2Default = button2.style.backgroundColor;

	   button1.addEventListener("click", function(){
	        button1.style.backgroundColor = "red";
	        button1.style.color = "white";
	        button2.style.backgroundColor = button2Default;
	   });

	   button2.addEventListener("click", function(){
	        button2.style.backgroundColor = "red";
	        button1.style.backgroundColor = button1Default;
	   });	
	
}
function popupFrmselfCloseSubmit(){
   var type = $("#type2").val();         /*  퇴근 */
   
   $.ajax({
      type : "POST",
      url : "<%=request.getContextPath()%>/commute/comm",
      data : {"type" : type},
      success : function(data){
         alert(data);
         self.close();
      }
   });
}

 function printClock() {
 
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var currentHours = currentDate.getHours();
    var currentMinute = addZeros(currentDate.getMinutes());
    var currentSeconds =  addZeros(currentDate.getSeconds());
    

    clock.innerHTML = calendar+"<br>"+currentHours+":"+currentMinute+":"+currentSeconds+" <span style='font-size:22px;'>"+ "</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
     var zero = '';
     num = num.toString();
     if (num.length < digit) {
       for (i = 0; i < digit - num.length; i++) {
         zero += '0';
       }
     }
     return zero + num;
}


</script>
<style>
.work {
    margin-top: -19px;
    margin-left: -6px;
    width: 102%;
}
.material-icons {
    font-size: 44px;
    margin-top: 21px;
    margin-left: 44%;
}
.gowork{
	background-color : white;
	float: left;
	font-size: 18px;
	border-radius: 50%;
	width: 68px;
    height: 68px;
    color: blacks;
    margin-top: 59px;
    margin-left: 106px;
    outline:none;"
}
.offwork{
	background-color: white;
	float: left;
	font-size: 18px;
	border-radius: 50%;
	width: 68px;
    height: 68px;
    color: black;
    margin-top:59px;
    margin-left:120px;
    outline:none; 
}
/* .gowork:focus-within, {
background-color: #003366; color:white;
}
.offwork:focus-within  {
background-color: #003366; color:white;
} */
.gowork:hover{
 color:white;
 background-color: #003366;
}
.offwork:hover {
 color:white;
 background-color: #003366;
}


</style>
<body style="margin-top:0px" onload="printClock()">
   <div  class="work"style="height: 69px; background-color: #003366;  color:white;">
<span class="material-icons">schedule</span></div><br>

<div id="date"></div>
    
<div style="height:9px;color:#666;font-size:22px; text-align:center;" id="clock">
</div> 


   <form name="popupForm">
      <div>
         <input type="hidden" name="type1" id="type1" value="gtw">
         <input type="button" class="gowork" onclick="popupFormselfCloseSubmit();" value="출근">
      </div>
   </form>
   <form name="popupFrm">
      <div>
         <input type="hidden" name="type2" id="type2" value="ow">
         <input type="button" class="offwork" onclick="popupFrmselfCloseSubmit();" value="퇴근">
      </div>
   </form>
</body>
</html>