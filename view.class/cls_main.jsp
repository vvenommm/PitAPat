<%@page import="java.util.regex.Pattern"%>
<%@page import="kr.or.ddit.pitapet.vo.ClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../images/logo.png"/>
<title>피터펫(PIT-A-PET)</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	
})
</script>
</head>

<%
	List<ClassVO> packList = (List<ClassVO>)request.getAttribute("packList");
	List<ClassVO> countList = (List<ClassVO>)request.getAttribute("countList");
// 	String id = (String)session.getAttribute("id");
// 	String id = "20007AD";
// 	String id = "20007TR";
	String id = "20006TR";
	String regex = "[0-9]{1,5}[A-Z]{2}";
	boolean result = Pattern.matches(regex, id);
%>

<body>

<h3>온라인 강의</h3>

<div>
	온라인 강의 소개하는 곳
</div>

<%
	System.out.println("edu main.jsp");

	if(result && id.substring(5).equals("TR")){
%>
<%-- 		<a href="<%=request.getContextPath()%>/Edu_Insert.do"><button>강의 등록</button></a> --%>
		<input type=button value="강의 등록" id = "insertCls">
		<input type=button value="내 강의 보기" id = "myCls">
<%
	}if(result && id.substring(5).equals("AD")){
%>
		<input type=button value="강의 등록" id = "insertCls">
		<input type=button value="강의 관리" id = "manageCls">
<%		
	}
%>

<div>
	<h4>기초</h4>
</div>

<div id="clsList" >
<%
	if(packList != null && packList.size() > 0){
// 	if(eduList == null || eduList.size() == 0){
%>
<%
		int i = 1;
		for(ClassVO vo : packList){
%>
		<div id="clsDiv">
			<table border="1" class="clsOne" >
			<tr>
				<td rowspan="4">
					<img src="images/J.png" style="width : 150px;"><br>
					<p style="display : none"><%=vo.getCls_no()%></p>
				</td>
				<td>
					<a href="/PitAPet/Edu_Detail.do?edu_no=<%=vo.getCls_no()%>" ><%=vo.getCls_subject()%></a>
				</td>
				
				<%
					for(ClassVO vo2 : countList){
						if(vo2.getCls_subject().equals(vo.getCls_subject())){
						
				%>
							<td style="text-align : right;">총 <%=vo2.getCls_count()%>강</td>
				<%	
					}
						}
				%>
			</tr>
			<tr>
				<td colspan="2" style="text-align : right;">강사 : <%=vo.getEmp_name()%></td>
			</tr>
			<tr>
<!-- 				<td></td> -->
				<td colspan="2"><%=vo.getCls_content()%></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align : right;"><%=vo.getCls_price()%>원</td>
			</tr>
			</table>
		</div>
		<br>
<%
		}
%>
</div>
<%
}else{
%>
		등록된 수업이 없습니다.
<%
	}
%>


</body>
</html>
