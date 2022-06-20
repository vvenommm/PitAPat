<%@page import="java.util.regex.Pattern"%>
<%@page import="kr.or.ddit.pitapet.vo.ClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../../include/header.jsp"></jsp:include>
<style>
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
	padding-top: 100px;
}

.br3 {
	clear: both;
}

/* 아래 클래스 디자인은 현재 페이지 표시할 때 span지정해 준 다음 span에 이 클래스 지정해 주시면 됩니다! */
.currmenu{
	color: orange;
	font-weight: bold;	
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
<script>
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
	
	//Jax의 내 강의실 
	$(function(){
		
	})
</script>
<!-- 각 끝의 jsp:includ를 감싸는 body 부분 -->
<div class="mypage">

<!-- 마이페이지 내용의 왼쪽 메뉴 부분 -->
	<div class="mymenu">
		<ul class="myBMenu">
			<li class="myBList"><a href="<%=request.getContextPath()%>/myEdu.do"><span class="currmenu">내 강의실</span></a></li>
			<li class="myBList"><a href="<%=request.getContextPath()%>/SelectMyWrite.do">내 작성글</a></li>
			<li class="myBList"><a href="<%=request.getContextPath()%>/MP_myPayment.do">내 결제내역</a></li>
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
	
<%
	List<ClassVO> myClsList = (List<ClassVO>)request.getAttribute("myClsList");
	String id = (String)request.getAttribute("id");

	if(id == null){
		id = "";
	}
	String regex = "[0-9]{1,5}[A-Z]{2}";
	boolean result = Pattern.matches(regex, id);
%>

<!-- 왼쪽 메뉴 부분을 누르면 해당하는 내용 출력 -->
	<div class="mycont">
	
	<div id = "subject">
		<h1 id = "h1Subject">내 강의실</h1>
	</div>
	
	
<%
System.out.println("jsp에서 myClsList 확인 " + myClsList);
	if(myClsList != null && myClsList.size() > 0){
%>
<%
		int i = 1;
		for(ClassVO vo : myClsList){
%>
		<div class="clsOne" style="display:inline-block">	
			<table border='1'>
  				<tr>
   					 <td colspan="2">
						<a href="/PitAPet/MP_myEdu_Detail.do?cls_subject=<%=vo.getCls_subject()%>" target="_self">
    					<img src="images/J.png" style="width : 100px;">
						</a>
   					 </td>
			  	</tr>
 				<tr>
 					<td colspan="2">
						<a href="/PitAPet/MP_myEdu_Detail.do?cls_subject=<%=vo.getCls_subject()%>" target="_self">
   						<%=vo.getCls_subject() %>
						</a>
					</td>
 				</tr>
 				<tr>
   					<td colspan='2'>
     					<progress id="file" value="20" max="100"> 50% </progress>
   					</td>
				</tr>
  				<tr>
    				<td colspan='2'>
      				진행률: <span>40.00%</span>
    				</td>
  				</tr>

			</table>
		</div>
<%
			if(i%3 == 0){
%>
				<br><br><br>
<%
			}
			i++;
		}
}else{
%>
	<div style="padding : 40px; padding-left : 27%;">
		<h3>구매한 수업이 없습니다.</h3>
	</div>
<%
	}
%>
	</div>
	<br class="br3">
</div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
