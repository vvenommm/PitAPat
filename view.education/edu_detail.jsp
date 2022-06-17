<%@page import="java.util.regex.Pattern"%>
<%@page import="kr.or.ddit.pitapet.vo.EducationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/WebContent/WEB-INF/images/logo.png"/>
<title>피터펫(PIT-A-PET)</title>
<%
	EducationVO eduOne = (EducationVO)request.getAttribute("eduOne");

//아이디 검증////////////////////////////////////////////////////
// 	String id = (String)session.getAttribute("id");
// if(id == null) id = "";
// 	String id = "";
// 	String id = "20007AD";
	String id = "20007TR";
// 	String id = "20006TR";
	String regex = "[0-9]{1,5}[A-Z]{2}";
	boolean result = Pattern.matches(regex, id);
	////////////////////////////////////////////////////////////////
%>

<script type="text/javascript">
$(function(){
	edu_no = "<%=eduOne.getEdu_no()%>";
	mem_id = "<%=id%>";

	//장바구니에 넣기
	$('#getInCart').on('click', function(){
		
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
	
	//훈련사의 강의 수정 누르면 수정 창으로 이동 
	$('#editEdu').on('click', function(){
		location.href="<%=request.getContextPath()%>/Edu_Edit.do?edu_no=<%=eduOne.getEdu_no()%>";
	})
		

	//훈련사의 강의 삭제
	$('#deleteEdu').on('click', function(){
		let text = '해당 강의를 삭제하시겠습니까?';
		if(confirm(text) == true){
<%-- 			location.href = "<%=request.getContextPath()%>/Cls_Delete.do?cls_subject=<%=clsOneList.get(0).getCls_subject()%>&cls_count=<%=cls_count%>"; --%>
		}
	})
	
	//다시 글목록으로
	$('#backToList').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Cls_Main.do";
	})
	
})
</script>

</head>
<body>
<%
	System.out.println("edu_detail.jsp");
	
	System.out.println(id + " : " + result);
	if(result && id.substring(5).equals("AD")){ //관리자일 때
		
%>
	<input type=button value="강의 수정" id = "editEdu">
	<input type=button value="강의 삭제" id = "deleteEdu"><br>
<%
	}else if(result && id.substring(5).equals("TR")&&id.equals(eduOne.getEmp_id())){ //훈련사 본인 글일 때
%>
	<input type=button value="강의 수정" id = "editEdu">
	<input type=button value="강의 삭제" id = "deleteEdu"><br>
<%
	}
%>



	<div class="eduOne" style="display:inline-block">
<table border="1">
	<tr>
		<td colspan="4">
		
			<img src="images/Better.jpg">
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
		<%=eduOne.getEdu_date2()%>
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
	<tr style="display : none" >
		<td colspan="4" style="display : none" >
			<p style="display : none" name = "edu_no"><%=eduOne.getEdu_no()%></p>
		</td>
	</tr>
</table>
	</div><br>
	<input type="button" id="getInCart" value="장바구니 담기">
	
<jsp:include page="../../include/footer.jsp" ></jsp:include>
