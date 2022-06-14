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
	ClassVO clsOne = (ClassVO)request.getAttribute("clsOne");

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

</script>
</head>
<body>

</body>
</html>
