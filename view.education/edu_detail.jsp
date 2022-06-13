<%@page import="java.util.regex.Pattern"%>
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
<%
	//아이디 검증////////////////////////////////////////////////////
// 	String id = (String)session.getAttribute("id");
	String id = "20007AD";
	String regex = "[0-9]{1,4}[A-Z]{3}";
	boolean result = Pattern.matches(regex, id);
	////////////////////////////////////////////////////////////////
%>

<script type="text/javascript">
$(function(){
	$('#intoCart').on('click', function(){
		eduOne = <%=request.getAttribute("eduOne")%>;
		
<%
		if(!result && id == null){
%>
			alert('로그인 후 이용 가능합니다.');
// 			location.href = "http://localhost/PitAPet/hom_login.do"
<%		
		}else{
%>
			mem_id = <%=id%>
			$.ajax({
				url : 'http://localhost/PitAPet/IntoCart.do',
				type : 'post',
				data : {"eduOne" : eduOne, "mem_id" : mem_id},
				dataType : 'json',
				success : function(res){
				alert('바구니에 담기 성공!');
				}
			})
<%		
		}
%>
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
	System.out.println("edu_detail.jsp");
	EducationVO eduOne = (EducationVO)request.getAttribute("eduOne");
	////////////////////////////////// 관리자일 때 수정, 삭제 버튼 나오게. 훈련사는 수정삭제 자기 글일 때 나오게.
	
	if(result && id.substring(5).equals("AD")){ //관리자일 때
		
%>
	<button>수정</button>
	<button>삭제</button><br>
<%
	}else if(result && id.substring(5).equals("TR")&&id.equals(eduOne.getEmp_code())){ //훈련사 본인 글일 때
%>
	<button>수정</button>
	<button>삭제</button><br>
<%
	}
%>
	<div class="eduOne" style="display:inline-block">
		<p style="display : none" name = "edu_no"><%=eduOne.getEdu_no()%></p>
<table border="1">
	<tr>
		<td colspan="4">
			<img src="../images/Better.jpg">
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="4">
			<p style="text-align : center;"><%=eduOne.getEdu_title()%></p>
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="4">
			<p style="text-align : right;">훈련사 <%=eduOne.getEmp_name()%></p><br><hr>
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>
			<p style="text-align : center;"><%=eduOne.getEdu_date()%></p>
		</td>
		<td>
			<p style="text-align : center;"><%=eduOne.getEdu_time()%></p>
		</td>
		<td>
			<p style="text-align : center;"><%=eduOne.getEdu_place()%></p>
		</td>
		<td>
			<p style="text-align : center;">모집인원 : <%=eduOne.getEdu_limit()%>명</p>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<p style="text-align : center;"><%=eduOne.getEdu_content()%></p>
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="4">
		<p style="text-align : center;"><%=eduOne.getEdu_price()%>원</p>
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>
	</div><br>
	<button id="intoCart">장바구니 담기</button>
	<button id='eduList'>목록 보기</button>
</body>
</html>
