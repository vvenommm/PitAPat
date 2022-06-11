<%@page import="kr.or.ddit.pitapet.vo.EducationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../images/logo.png"/>
<title>피터펫(PIT-A-PET)</title>
</head>

<%
// 	List<EducationVO> eduList = (List<EducationVO>)request.getAttribute("eduList");
%>

<body>
<h3> 피터펫 오프라인 강의 소개</h3>
<div id = "eduIntro">
오프라인 강의 사진이나 소갯말 지나가는 곳
</div>



<%
// 	if(eduList != null && eduList.size() > 0){
// 	if(eduList == null || eduList.size() == 0){
%>

출력하기

<%
// 	}else{
%>

		아무것도 없습니다.


<%
// 	}
%>


</body>
</html>
