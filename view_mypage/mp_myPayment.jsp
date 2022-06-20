<%@page import="kr.or.ddit.pitapet.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<jsp:include page="../../include/header.jsp"></jsp:include>
<script>
 $(function() {
	 $('.date').on('change', function() {
		 date = $('.date').val();
		 $.ajax({
			 url  : '/PitAPet/CartPayDate.do',
			 data : { "date" : date },
			 type : 'get',
			 dataType : 'json',
			 success : function(res) {
				if(list == null) {
					alert('조회한 날짜에 해당하는 결제내역이 없습니다.');
				}else {
					
				}
			 }
		 })
	 })
 })
 
 	$(function() {
		// 정보 수정을 눌렀을 때 하위 목록 나타나도록 하는 이벤트
		$('#myInfo').on('click', function() {
			//아래 메뉴 div가 보여져 있으면 사라지게 하기
			if ($('#updateInfo').is(":visible")) {
				$('#updateInfo').slideUp();
			} else {
				$('#updateInfo').slideDown();
			}
		})
	})
</script>
<style>
 .fee {
 	text-align : right;
 }
 .tab {
 	width : 800px;
 }
 .mypage{
	margin-top: 120px;
	min-height: 800px;
}

.myBMenu {
	cursor: pointer;
	width: 20%;
	float: left;
	list-style: none;
	text-align: center;
	padding-top: 100px;
}

.myBList{
	margin-bottom: 30px;
}

#updateInfo {
	display: none;
	padding-left: 28%;
}

.mySMenu {
	cursor: pointer;
	list-style: none;
	width: 70%;
	font-size: 0.9em;
	text-align: left;
}

.mycont {
	width: 70%;
	float: right;
}

.br3 {
	clear: both;
}

/* 아래 클래스 디자인은 현재 페이지 표시할 때 span지정해 준 다음 span에 이 클래스 지정해 주시면 됩니다! */
.currmenu{
	color: orange;
	font-weight: bold;	
}

.mymenu{
/* 	width: 500px; */
}

.myBMenu{
/* 	border : 1px solid #ff8c00; */
}

.mymenu a:link{
	color: black;
}

.mymenu a:visited {
	color: black;
}

.mymenu a:hover {
	color: orange;
	text-decoration: none;
}
#subject{
	border-top : 2px solid #ff8c00;
	border-bottom : 2px solid #ff8c00;
	text-align: center;
	height: 100px;
	padding : 18px;
	margin-bottom: 100px;
	text-align : center;
	color : orange;
 	font-family: 'Do Hyeon', sans-serif;
 	margin-right: 20%;
}
#divStyle{
	margin-top : 20px;
 	border : 2px solid orange;
 	border-radius : 20px;
 	padding : 50px;
	margin-right:20%;  
}
.thTitle{
/* 	color : orange; */
/*  	font-size : 1.5em; */
 	font-family: 'Do Hyeon', sans-serif;
}
#h1Subject{
 	color : orange;
 	font-family: 'Do Hyeon', sans-serif;
	font-size: 3.0em;
}
#noBooking{
	padding-top : 10%;
	font-size: 2.0em;
	text-align: center;
}
</style>
<!-- 각 끝의 jsp:includ를 감싸는 body 부분 -->
<div class="mypage">

<!-- 마이페이지 내용의 왼쪽 메뉴 부분 -->
	<div class="mymenu">
		<ul class="myBMenu">
			<li class="myBList"><a href="<%=request.getContextPath()%>/myEdu.do">내 강의실</a></li>
			<li class="myBList"><a href="<%=request.getContextPath()%>/SelectMyWrite.do">내 작성글</a></li>
			<li class="myBList"><a href="<%=request.getContextPath()%>/MP_myPayment.do"><span class="currmenu">내 결제내역</span></a></li>
			<li class="myBList" id="myInfo"><a href="#">정보 수정</a>
				<div id="updateInfo">
				<ul class="mySMenu">
					<li class="mySList"><a href="<%=request.getContextPath()%>/myInfo.do">- 개인 정보 수정</a></li>
					<li class="mySList"><a href="<%=request.getContextPath()%>/myDogInfo.do">- 강아지 정보 수정</a></li>
				</ul>
				</div>
			</li>
			<li class="myBList"><a href="<%=request.getContextPath()%>/HTL_myBookingList.do">호텔링 예약 내역/수정</a></li>
			<li class="myBList"><a href="<%=request.getContextPath()%>/SelectMyQna.do">1:1 문의</a></li>
			<li class="myBList"><a href="<%=request.getContextPath()%>/showmemWidraw.do">회원 탈퇴</a></li>
		</ul>
	</div>
	  
<!-- 왼쪽 메뉴 부분을 누르면 해당하는 내용 출력 -->
	<div class="mycont">
	<br>
	<br>
	<br>
	<br>
	<div id = "subject">
		<h1 id = "h1Subject">내 결제내역</h1>
	</div>
	
	 <p>구매가 완료되었습니다. 이용해주셔서 감사합니다.<br>
	 결제 이후 상품의 이용방법, 반품 등에 대한 문의는 판매자에게 문의해주세요.</p>
  <hr><br><br>

<div id = "divStyle">
<table class = "table">		
	<thead>
		<tr>
			<th class = "thTitle">결제일</th>
			<th class = "thTitle">상  품</th>
			<th class = "thTitle">가  격</th>
			<th class = "thTitle">결제상태</th>
		</tr>
	</thead>
<%
	int i = 1;
List<CartVO> list = (List<CartVO>)request.getAttribute("list");
	
	if(list != null && list.size()>0){
		for(CartVO vo : list){
%>

<!-- 예약 번호 클릭시 해당 예약번호의 상세내용 가져오기 -->
	<tbody>
		<tr onclick="myPayment()">
			<td><%=i++ %></td>
			<td><%=vo.getPay_no() %></td>
			<%
				if(vo.getCls_no() != null){
			%>
				<td><%=vo.getCls_subject()%></td>
			<%		
				}else if(vo.getKin_code() != null){
			%>
				<td><%=vo.getKin_gubun() %></td>
			<%		
				}else if(vo.getEdu_no() != null){
			%>
				<td><%=vo.getEdu_title() %></td>
			<%
				}
			%>
			
			
			<%
				if(vo.getCls_no() != null){
			%>
				<td><%=vo.getCls_fee()%></td>
			<%		
				}else if(vo.getKin_code() != null){
			%>
				<td><%=vo.getKin_fee() %></td>
			<%		
				}else if(vo.getEdu_no() != null){
			%>
				<td><%=vo.getEdu_fee() %></td>
			<%
				}
			%>
			<td><%=vo.getCart_status() %></td>
		</tr>
	</tbody>
	
<%
 		}
	}else{
%>		 
	<tbody>
		<tr>
			<td id = "noBooking" colspan = '5'>결제 내역이 없습니다.</td>
		</tr>
	</tbody>	
<%	
	}
%>
</table>
</div>

  
  <br><br><br>
	</div>
	
	<br class="br3">
</div>
<jsp:include page="../../include/footer.jsp"></jsp:include>	  
	
