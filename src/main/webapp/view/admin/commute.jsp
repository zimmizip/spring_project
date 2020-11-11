<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>출퇴근</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css" />
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<script>
			function myFunction1() {
			  var input, filter, table, tr, td, i;
			  input = document.getElementById("myInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("myTable");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[0];
			    if (td) {
			      txtValue = td.textContent || td.innerText;
			      if (txtValue.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }
			  }
			}
			
			function myFunction2() {
				  var input, filter, table, tr, td, i;
				  input = document.getElementById("myInput2");
				  filter = input.value.toUpperCase();
				  table = document.getElementById("myTable");
				  tr = table.getElementsByTagName("tr");
				  for (i = 0; i < tr.length; i++) {
				    td = tr[i].getElementsByTagName("td")[1];
				    if (td) {
				      txtValue = td.textContent || td.innerText;
				      if (txtValue.toUpperCase().indexOf(filter) > -1) {
				        tr[i].style.display = "";
				      } else {
				        tr[i].style.display = "none";
				      }
				    }
				  }
				}
			
			function myFunction3() {
				  var input, filter, table, tr, td, i;
				  input = document.getElementById("myInput3");
				  filter = input.value.toUpperCase();
				  table = document.getElementById("myTable");
				  tr = table.getElementsByTagName("tr");
				  for (i = 0; i < tr.length; i++) {
				    td = tr[i].getElementsByTagName("td")[2];
				    if (td) {
				      txtValue = td.textContent || td.innerText;
				      if (txtValue.toUpperCase().indexOf(filter) > -1) {
				        tr[i].style.display = "";
				      } else {
				        tr[i].style.display = "none";
				      }
				    }
				  }
				}
		</script>
	</head>
	<style class ="text/css">
		#myTable:hover tr:hover td {
			    background: #003366;
			    color: white; }
	</style>
	
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<label class="logo"><strong>멤버 관리</strong></label>
								</header>
						</div>
						<div class="w3-container" style = "margin-left: 55px; padding-top: 10px; margin-right: 55px;">
						  <h2>출퇴근 기록</h2>
						  <input class="w3-input w3-border w3-padding" type="text" placeholder="이름을 입력하세요." id="myInput" onkeyup="myFunction1()" style = "width: 30%; display: inline">
						  <input class="w3-input w3-border w3-padding" type="text" placeholder="이메일을 입력하세요." id="myInput2" onkeyup="myFunction2()" style = "width: 30%; display: inline">
						  <input class="w3-input w3-border w3-padding" type="text" placeholder="날짜를 입력하세요." id="myInput3" onkeyup="myFunction3()" style = "width: 30%; display: inline">
						  <table class="w3-table-all w3-margin-top" id="myTable">
						    <tr>
							  <th>이름</th>
						      <th>이메일</th>
						      <th>날짜</th>
						      <th>출근</th>
						      <th>퇴근</th>
						    </tr>
						    
						    <c:forEach   var="commute"  items="${articleList}">
							    <tr>
							      <td>${commute.name }</td>
							      <td>${commute.email }</td>
							      <td>${commute.day }</td>
							      <td>${commute.gtw }</td>
							      <td>${commute.ow }</td>
							    </tr>
						    </c:forEach>
						  </table>
						</div>
					</div>
				<!-- Main 끝 -->
