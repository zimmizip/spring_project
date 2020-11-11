<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
   <c:if test="${findpass ne null}">
      <!-- 찾은 비밀번호 있을때 -->
        <div class="find"style="height: 60px; background-color: #3c4d6d; color: white; margin-top: -19px; margin-left: -7px; width: 103%;">
      <span class="material-icons" style="font-size: 30px;margin-top: 25px;margin-left: 44%;">lock_open</span>
   </div><br/>
      <h3 style="text-align: -webkit-center; margin-top: -3px; margin-left: 9px; font-family: inherit;">비밀번호찾기</h3>
      <h5 style="margin-top: -8px; text-align: center;">비밀번호를 찾았습니다.</h5>
      <div class="find"
         style="text-align-last: center; margin-bottom: 20px; text-align-last: center; margin-bottom: 20px; border: 1px solid #3c4d6d;border-width: 3px;
    margin-top: -17px;width: 71%;margin-left: 57px;">
    &nbsp; ${findpass} &nbsp;</div>
   </c:if>

   <c:if test="${findpass eq null}">
      <!-- 찾은 비밀번호 없을때 -->
      <div class="nofind"style="height: 60px; background-color: #3c4d6d; color: white; margin-top: -19px; margin-left: -7px; width: 103%;">
      <span class="material-icons" style="font-size: 30px;margin-top: 25px;margin-left: 44%;">lock</span>
   </div><br/>
   <h3 style="text-align: -webkit-center; margin-top: -3px; margin-left: 9px; font-family: inherit;">비밀번호찾기</h3>
      <h5 style="margin-top: -8px; text-align: center;">입력한 정보가 올바르지 않습니다.</h5>
</c:if>

   <div class="click" style="text-align: center;">
      <input type="button" value="확인" onclick="self.close()" style="background-color: #3c4d6d;color: white;">
   </div>
</body>
</html>