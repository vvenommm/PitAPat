<%@page import="kr.or.ddit.pitapet.vo.EducationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="WEB-INF/images/logo.png"/>
<title>피터펫(PIT-A-PET)</title>

<script type="text/javascript">
$(function(){
	$('#intoCart').('click', function(){
		$.ajax({
			url : 'http://localhost/pap/IntoCart.do',
			type : 'post',
			data : '',
			dataType : 'json',
			success : function(res){
				alert('바구니에 담기 성공!');
			}
		})
	})
// 	$('#back').('click', function(){
// 		$.ajax({
// 			url : '',
// 			type : 'post',
// 			data : '',
// 			dataType : 'json',
// 			success : function(res){
				
// 			}
// 		})
// 	})
})
</script>

</head>
<body>
<%
	EducationVO eduOne = (EducationVO)request.getAttribute("eduOne");

%>
	<div class="eduOne" style="display:inline-block">
		<image src="/WebContent/WEB-INF/images/Better.jpg"><br>
		<p style="display : none" name = "edu_no"><%=eduOne.getEdu_no()%></p>
		<p style="text-align : center;"><%=eduOne.getEdu_title()%></p>
		<p style="text-align : center;">훈련사 <%=eduOne.getEmp_name()%></p><br><hr>
		<p style="text-align : center;"><%=eduOne.getEdu_content()%></p>
		<p style="text-align : center;"><%=eduOne.getEdu_date()%></p>
		<p style="text-align : center;"><%=eduOne.getEdu_time()%></p>
		<p style="text-align : center;"><%=eduOne.getEdu_place()%></p>
		<p style="text-align : center;"><%=eduOne.getEdu_price()%>원</p>
		<p style="text-align : center;">모집인원 : <%=eduOne.getEdu_limit()%>명</p>
	</div>
	<button id="intoCart">장바구니 담기</button><button id='back'>뒤로가기</button>
</body>
</html>
