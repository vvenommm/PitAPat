<%@page import="java.util.List"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="kr.or.ddit.pitapet.vo.ClassVO"%>
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
	List<ClassVO> clsOneList = (List<ClassVO>)request.getAttribute("clsOne");

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
$(function(){
	
	//훈련사의 강의 수정
	$('#editCls').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Cls_Insert.do"
	})
	
	//훈련사의 강의 삭제
	$('#editCls').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Cls_Insert.do"
	})
	
	//훈련사가 등록&삭제 신청한 강의 승인
	$('#editCls').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Cls_Apprval.do?cls=status'승인'"
	})
	
	//훈련사가 등록&삭제 신청한 강의 거절
	$('#editCls').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Cls_Apprval.do?cls_status='거절'"
	})
	
	//훈련사가 등록&삭제 신청한 강의 삭제
	$('#editCls').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Cls_Insert.do"
	})
	
	
	
	
	
	
	
	
	
	
	
})
</script>
</head>
<body>
<div>you are on cls_detail.jsp</div>

<%
	System.out.println("cls_detail.jsp");
	
	System.out.println(id + "와" + result);
	if(result && id.substring(5).equals("AD")){ //관리자일 때
%>
	<input type=button value="강의 수정" id = "editCls">
	<input type=button value="강의 삭제" id = "deleteCls"><br>
<%
	}else if(result && id.substring(5).equals("TR")&&id.equals(clsOneList.get(0).getEmp_id())){ //훈련사 본인 글일 때
%>
	<input type=button value="강의 수정" id = "editCls">
	<input type=button value="강의 삭제" id = "deleteCls"><br>
<%
	}
%>
	<div class="clsOne" style="display:inline-block">
		<p style="display : none" id = "cls_no"><%=clsOneList.get(0).getCls_no()%></p>

<table border="1" id="tab">
	<tr>
		<td colspan="3" rowspan="6">
			<img src="images/J.png" style="width : 150px;">
		</td>
		<td>주제</td>
		<td colspan="2"><%=clsOneList.get(0).getCls_subject() %></td>
	</tr>
	<tr>
		<td>강의자</td>
		<td colspan="2"><%=clsOneList.get(0).getEmp_name() %></td>
	</tr>
	<tr>
		<td>가격</td>
		<td colspan ="2"><%=clsOneList.get(0).getCls_price() %>원</td>
	</tr>
	<tr>
		<td>
		내용
		</td>
		<td colspan="3" rowspan="3">
		<%=clsOneList.get(0).getCls_content() %>
		</td>
	</tr>
	<tr></tr>
	<tr></tr>
	<%
	if(clsOneList != null && clsOneList.size() > 0){
		for(int i = 0; i < clsOneList.size(); i++){
	%>
		<tr><td colspan="6"><%=clsOneList.get(i).getCls_title()%></td></tr>
	
	<%	
		}
	}
	%>
	<tr><td colspan="6" style="text-align : right;">총 <%=clsOneList.get(0).getCls_count() %>강</td></tr>
</table>
</div><br>

	<input type="button" id="getInCart" value="장바구니 담기">

<jsp:include page="../../include/footer.jsp" ></jsp:include>
