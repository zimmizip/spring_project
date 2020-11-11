<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkSpace Create</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script>
function Workspace_make(){
   var workspace_name = $("#workspace_name").val();
   var overlapCheck = $("#overlapCheck").val();
   //alert(overlapCheck);
   if(overlapCheck.indexOf("사용가능") != -1){
      $.ajax({
         type : "POST",
         url : "<%=request.getContextPath()%>/workspace_make/Workspace_make",
         data : {"workspace_name" : workspace_name},
         success : function(data){
            alert(data);
            opener.parent.location.reload();
            self.close();
         }
      });
   }else{
      alert("중복확인이 안되었습니다.");   
   }   
}
function overlap(){
   var workspace_name = $("#workspace_name").val();
   
   $.ajax({
      type : "POST",
      url : "<%=request.getContextPath()%>/workspace_make/Workspace_name",
      data : {"workspace_name" : workspace_name},
      success : function(data){
         alert(data);
         if(data.indexOf("사용가능") != -1){
            $("#overlapCheck").val("사용가능");
         }
      }
   });
}
</script>
<style>
.make {
    margin-top: -19px;
    margin-left: -7px;
    width: 103%;
}
input[type="button"] {
    color: #fff;
    background-color: #003366;
}
h3 {
    margin-top: -3px;
    margin-left: 9px;
    font-family: inherit;
    text-align: center;
}
.material-icons {
    font-size: 50px;
    margin-top: 14px;
    margin-left: 44%;
}
form {
    margin-top: -22px;
    margin-left: 10px;
    text-align: center;
}
input#workspace_name {
    width: 197px;
}
</style>
<body>
<div  class="make"style="height: 69px; background-color: #003366;  color:white;">
 <span class="material-icons">create_new_folder</span></div><br>
       <h3>워크스페이스 생성하기</h3><br>
   <form>
<%--       <input type="hidden" id="email" value="${email }">
      <input type="hidden" id="name" value="${name }"> --%>
      <input type="text" id="workspace_name" placeholder="워크스페이스 이름을 입력하세요.">
      <input type="button" onclick="overlap()" value="중복확인" >
      <input type="hidden" id="overlapCheck" value="사용불가">
      <input type="button" id="make_button" onclick="Workspace_make();" value="생성" >
   </form>
</body>
</html>