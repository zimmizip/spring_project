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
<link href="<%=request.getContextPath()%>/img/favicon.png" rel="icon">
<link href="<%=request.getContextPath()%>/img/apple-touch-icon.png"
   rel="apple-touch-icon">

<!-- Bootstrap core CSS -->
<link
   href="<%=request.getContextPath()%>/lib/bootstrap/css/bootstrap.min.css?ver=8"
   rel="stylesheet">
<!--external css-->
<link
   href="<%=request.getContextPath()%>/lib/font-awesome/css/font-awesome.css"
   rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/style.css?ver=11"
   rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style-responsive.css"
   rel="stylesheet">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/to-do.css">


</head>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
 function getContextPath() {
   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};  W2
function commute(){
   var _left = Math.ceil(( window.screen.width - 400 )/2);
    var _top = Math.ceil(( window.screen.width-800 - 150 )/2); 
    window.open("../commute/commute", "근태일지", "width=494, height=232 left= " + _left + ", top=" + _top );

}
function documents(){
   var _left = Math.ceil(( window.screen.width - 500 )/2);
    var _top = Math.ceil(( window.screen.width-800 - 500 )/2); 
    window.open("../document/document_approval_", "전자결재", "width=605, height=560 left= " + _left + ", top=" + _top );   
}
function logout(){
   sessionStorage.removeItem("workspace_name"); 
   location.href="../main/main";
}
function out(){
     var delConfirm = confirm('워크스페이스를 탈퇴하시겠습니까?');
      if (delConfirm) {
         $.ajax({
               type : "POST",
               url : "<%=request.getContextPath()%>/main/workspace_out",
               success : function(data){
                 alert(data);
                  if(data.indexOf("탈퇴 완료")){
                     location.href="../main/main";
                  }                
               }
         });
      }
      else {
         alert('삭제가 취소되었습니다.');
     }
}
/*    웹소켓 자바스크립트 */

    
function enterKey(e) {

   if (e.keyCode == 13) {
         send();       
   }
}
document.body.scrollTop = document.body.scrollHeight;
   </script>
      <style>
         li.mt:hover {
             background-color: #6078ea;
             width: 96%;
         }
         #me {
            position: relative;
                left: 227px;
            min-width: 100px;
            max-width : 284px;
            border: 2px solid #003366;
            border-radius: 4px;
            color: #003366;
            font-size: 16px;
            padding: 5px;
         }
         
         #you {
            position: relative;
            left: 10px;
            min-width: 100px;
            max-width : 284px;
            border: 2px solid #003366;
            border-radius: 4px;
            color: #003366;
            font-size: 16px;
            padding: 5px;
         }
         

         #connect {
             position: relative;
             left: 232px;
             max-width: 151px;
             color: red;
             font-size: 12px;
             padding: 5px;
         }
         #inputMessage {
    position: relative;
    /* left: 20px; */
    height: 70px;
    width: 60%;
}
         #btnSend {
    margin-left: 40px;
    width: 29%;
    height: 66px;
    background-color: #003366;
    color: white;
    border-radius: 8px;
}
         
      </style>
<body>
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
                  style="color: white; margin-top: 18px; margin-right: 30px; font-size: 18px">${name}
                  님</li>
               <li><a class="logout" href="javascript:logout();" onclick = "onClose(event);">메인가기</a></li>
            </ul>
         </div>
      </header>
      <!--header end-->

      <!--사이드바 시작-->
      <aside>
         <div id="sidebar" class="nav-collapse "
            style="background-color: #003366; width:268px; height: 98%;">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion" style="display: block; margin-top:124px; margin-left: 16px;">
            
              <li class="mt">
           <a  href="javascript:commute();"> 
         <i class="fa fa-briefcase" aria-hidden="true"></i>
              <span>출근/퇴근</span>
              </a>
          </li>
      
          <li class="mt">
            <a class="active" target="_blank" href="https://192.168.0.158:3000/"> 
             <i class="fa fa-desktop"></i>
              <span>화상 회의</span>
              </a>
          </li>
          <li class="mt">
           <a href="javascript:documents();"> 
         <i class="fa fa-file-text-o" aria-hidden="true"></i>
              <span>전자 결제</span>
              </a>
          </li>
          <li class="mt">
            <a class="active" href="../board/list">
             <i class="fa fa-clipboard" aria-hidden="true"></i>
              <span>게시판</span>
              </a>
          </li>
          <c:if test="${manager eq '0' }">
          <li class="mt">
            <a class="active" href="javascript:out();">
             <i class="fa fa-power-off" aria-hidden="true"></i>
              <span>워크스페이스 탈퇴</span>
              </a>
          </li>
          </c:if>
        </ul>
            <!--사이드바 메뉴 끝-->
         </div>
      </aside>
      <!--sidebar end-->
      <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
      <!--빈 메인페이지-->
      <section id="main-content" >
         <section class="wrapper">
            <h3>
               <i class="fa fa-angle-right"></i>${workspace_name }
            </h3>
            <c:choose>
               <c:when test="${manager eq '1' }">
                  <div class="setting" style="float: right; margin-top: -37px">
                     <li style="list-style: none; font-size: x-large;" > 
                        <a href="<%=request.getContextPath()%>/admin/admin" target="_blank" style="color: #003366"> 
                           <i class="fa fa-cog" aria-hidden="true"></i>
                           <span>setting</span>
                        </a>
                     </li>
                  </div>
               </c:when>
               <c:when test="${manager eq '0' }">
                  <div class="setting" style="float: right; margin-top: -37px">
                     <li style="list-style: none; font-size: x-large;" > 
                        <span>일반 멤버</span>
                    </li>
                 </div>
               </c:when>
            </c:choose>

         </section>
         <!-- /wrapper -->
      </section>
      <!-- 내용헤드  끝-->
      <!--채팅 시작-->
      <div>
         <hr style="margin-top: 20px;margin-bottom: 20px;border: 0;border-top: 1px solid #797979;">
      </div>
      <section id="wrapper">
      <section id="main-content" >
         <div class="col-md-12">
            <div class="content-panel" style="height: 777px;">
               <h4>
                  <i class="fa fa-angle-right"></i> 공지사항
               </h4>
               <hr  style="margin-top: 20px;margin-bottom: 20px;border: 0;border-top: 1px solid #797979;">
               <table class="table">
                  <thead>
                  <tr>
                     <th style="text-align: center;width: 81%;">제 목</th>
                        <th style="text-align: center;">등록일자</th>                  
                     </tr>
                  </thead>
                  <tbody>
                    <c:forEach   var = "notice"  items = "${noticeList}">
                     <tr class = "noti1" onclick = "window.open('noticeContent?num=${notice.num }','','width=700,height=800,location=no,status=no,scrollbars=yes');">
                        <td style="text-align: center;">${notice.title }</td>
                        <td style="text-align: center;">${notice.day }</td>
                     </tr>
                     </c:forEach> 
                  </tbody>
               </table>
            </div>
         </div></section>
         <!-- 채팅 -->
          <section id="main-content">
         <div class="col-md-12">
            <div class="content-panel" style="height: 777px;">
               <h4>
                  <i class="fa fa-angle-right"></i> 채팅창
               </h4>
               <hr  style="margin-top: 20px;margin-bottom: 20px;border: 0;border-top: 1px solid #797979;">
               <div style="float:right;width: 96%;height:63vh;margin-top: -21px;">      
                  <fieldset>
                     <div class="w3-pale-yellow" id="messageWindow" style="width: 97%;height: 432px;border: 1px solid grey;overflow: auto;">

                        <c:forEach var = "chat" items = "${chatList}">
                           <c:if test = "${chat.name eq name }">
                              <div class='w3-yellow w3-border w3-round-large w3-padding-small' id='me' style='word-break:break-all;'>
                                 &nbsp;&nbsp;${chat.content }
                              </div><br>
                           </c:if>
                           <c:if test = "${chat.name ne name }">
                              <div id='you' class='w3-white w3-border w3-round-large w3-padding-small' style='word-break:break-all;'>
                                 ${chat.name }:${chat.content }
                              </div><br>
                           </c:if>
                        </c:forEach>
                       </div>
                        <br />
                      <div>
                        <input id="inputMessage" type="text" onkeypress="enterKey(event)"/> 
                        <input id = "btnSend" type="submit" value="send" onclick="send()" />
                      </div> 
                    </fieldset>
                </div>
            </div>
      </div>
      </section></section>
      <!--footer end-->
   </section>
   <!-- js placed at the end of the document so the pages load faster -->
   <script src="<%=request.getContextPath()%>/lib/jquery/jquery.min.js"></script>
   <script
      src="<%=request.getContextPath()%>/lib/bootstrap/js/bootstrap.min.js"></script>
   <script class="include" type="text/javascript"
      src="<%=request.getContextPath()%>/lib/jquery.dcjqaccordion.2.7.js"></script>
   <script
      src="<%=request.getContextPath()%>/lib/jquery.scrollTo.min.js"></script>

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
   <script>
   
   var name = "${name}"
	   var workspace = "${workspace_name }"
         
         $('#messageWindow').scrollTop($('#messageWindow')[0].scrollHeight);
      var textarea = document.getElementById("messageWindow");
       var webSocket = new WebSocket('ws://192.168.0.158:8085/Comwork/weball');
       var inputMessage = document.getElementById('inputMessage');
       
       webSocket.onerror = function(event) {     onError(event)   };
       webSocket.onopen = function(event) {     onOpen(event)    };
       webSocket.onmessage = function(event) {   onMessage(event) };
       webSocket.onclose = function(event) {   onClose(event) };
       
       function onMessage(event) {
          if(event.data.indexOf("입장~!") != -1 || event.data.indexOf("퇴장~!") != -1) {
             textarea.innerHTML += "<div  id='connect'  class='w3-white "
                 +"w3-border w3-round-large w3-padding-small' "
                 +"style='word-break:break-all;'>"
                 +event.data + "</div><br>";
             textarea.scrollTop=textarea.scrollHeight;
          } else {
             textarea.innerHTML += "<div  id='you'  class='w3-white "
             +"w3-border w3-round-large w3-padding-small' "
             +"style='word-break:break-all;'>"
             +event.data + "</div><br>";
              textarea.scrollTop=textarea.scrollHeight;  
            }
       }
       
       function onOpen(event) {
          textarea.innerHTML += "연결 성공<br>";
          webSocket.send(name + ":입장~!");   
        }
       
       function onError(event) {     alert(event.data);   }
       
       function send() {
          if(inputMessage.value == '') {
             return
          } else {
              textarea.innerHTML += "<div  class='w3-yellow w3-border "
              +"w3-round-large w3-padding-small' "
              +" id='me' style='word-break:break-all;'>" 
              + inputMessage.value 
              + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><br>";
              textarea.scrollTop=textarea.scrollHeight;
              webSocket.send(name + ":" + inputMessage.value + ":" + workspace);
            inputMessage.value = "";
          }
      }
       
       function onClose(event) {
          webSocket.send(name + ":퇴장~!");
       }
  </script>

</body>

</html>