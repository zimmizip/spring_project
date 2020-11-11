<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
function Workspace_attend(){
   var code1 = $("#code1").val();
   var code2 = $("#code2").val();
   var code3 = $("#code3").val();
   var code4 = $("#code4").val();
   var code = code1.concat(code2,code3,code4);
   

   $.ajax({  
      type : "POST",
      url : "<%=request.getContextPath()%>/workspace_attend/Workspace_attend",
      data : {"code" : code},
      success : function(data){
         alert(data);
         opener.parent.location.reload();
         self.close();
      }
   });
}

$(function() {
    $("#code1").keyup (function () {
        if (this.value.length == 1) {
            $(this).next('#code2').focus();
            return false;
        }
    });
});
$(function() {
    $("#code2").keyup (function () {
        if (this.value.length == 1) {
            $(this).next('#code3').focus();
            return false;
        }
    });
});
$(function() {
    $("#code3").keyup (function () {
        if (this.value.length == 1) {
            $(this).next('#code4').focus();
            return false;
        }
    });
});

</script>

<style>
.attend {
    margin-top: -19px;
    margin-left: -7px;
    width: 103%;
}
.material-icons {
    font-size: 50px;
    margin-top: 14px;
    margin-left: 44%;
}
h3 {
    margin-top: -3px;
    margin-left: 9px;
    font-family: inherit;
    text-align: center;
}
form {
    margin-top: -26px;
    margin-left: 10px;
}
input#attend_button {
    background-color: #003366;
    color: white;
    font-size: initial;
    /* border-radius: 4px; */
    width: 74px;
}
.attendform {
    text-align: center;
}
</style>
<body>
<div  class="attend"style="height: 69px; background-color: #003366;  color:white;">
 <span class="material-icons">lock</span></div><br>
 <div class="form">
       <h3>워크스페이스 참가하기</h3><br>
       <div class="attendform">
   <form>
      <!-- <input type="hidden" id="email" value="tempUser">
      <input type="hidden" id="name" value="임시"> -->
      <a>초대 코드를 입력하세요</a><br><br>
      <input type="text" maxlength="1" style="width:10px;" id="code1">
      <input type="text" maxlength="1" style="width:10px;" id="code2">
      <input type="text" maxlength="1" style="width:10px;" id="code3">
      <input type="text" maxlength="1" style="width:10px;" id="code4">
      
      <input type="button" id="attend_button" onclick="Workspace_attend();" value="참가하기" >
   </form></div></div>
</body>
</html>