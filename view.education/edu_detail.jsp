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
	EducationVO eduOne = (EducationVO)request.getAttribute("eduOne");

//아이디 검증////////////////////////////////////////////////////
// 	String id = (String)session.getAttribute("id");
// if(id == null) id = "";
// 	String id = "";
	String id = "20007AD";
// 	String id = "20007TR";
// 	String id = "20006TR";
	String regex = "[0-9]{1,5}[A-Z]{2}";
	boolean result = Pattern.matches(regex, id);
	////////////////////////////////////////////////////////////////
%>

<script type="text/javascript">
window.onload() = function(){
	$('#getInCart').on('click', function(){
		
		edu_no = <%=eduOne.getEdu_no()%>;
		mem_id = <%=id%>;
		
		if(mem_id.equals("")){
			alert('로그인 후 이용 가능합니다.');
		}else{
			$.ajax({
				url : 'http://localhost/PitAPet/IntoCart.do',
				type : 'post',
				data : {"edu_no" : edu_no, "mem_id" : mem_id},
				success : function(res){
					alert("장바구니에 담기 성공!");
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			});
		}
	})
}
</script>

</head>
<body>
<%
	System.out.println("edu_detail.jsp");
	
	System.out.println(id + "" + result);
	if(result && id.substring(5).equals("AD")){ //관리자일 때
		
%>
	<input type=button value="강의 수정" id = "editEdu">
	<input type=button value="강의 삭제" id = "deleteEdu"><br>
<%
	}else if(result && id.substring(5).equals("TR")&&id.equals(eduOne.getEmp_code())){ //훈련사 본인 글일 때
%>
	<input type=button value="강의 수정" id = "editEdu">
	<input type=button value="강의 삭제" id = "deleteEdu"><br>
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
			<%=eduOne.getEdu_title()%>
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="4">
			훈련사 <%=eduOne.getEmp_name()%>
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="2">
		<%=eduOne.getEdu_date()%>
		</td>
		<td>
		<%=eduOne.getEdu_time()%>
		</td>
		<td>
			<%=eduOne.getEdu_place()%>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<%=eduOne.getEdu_content()%>
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="2">
			모집인원 : <%=eduOne.getEdu_limit()%>명
		</td>
		<td colspan="2">
			<%=eduOne.getEdu_price()%>원
		</td>
	</tr>
</table>
	</div><br>
	<input type="button" id="getInCart" value="장바구니 담기">
	<button id='eduList'>목록 보기</button>
</body>
</html>
