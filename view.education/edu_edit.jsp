<%@page import="kr.or.ddit.pitapet.vo.EducationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../images/logo.png"/>
<title>피터펫(PIT-A-PET)</title>
<%
	EducationVO eduOne = (EducationVO)request.getAttribute("eduOne");
	String date = eduOne.getEdu_date().substring(0, 10);
	
%>
</head>
<body>

<div id='edu_edit_div'>
	<form action="/PitAPet/Edu_Edit.do" method="post">
		<input type='text' id='edu_no' name='edu_no' class="eduInsert" value="<%=eduOne.getEdu_no()%>" style="display : none"><br>
		
		<label>교육 제목</label>
		<input type='text' id='edu_title' name='edu_title' class="eduInsert" value="<%=eduOne.getEdu_title()%>"><br>

		<label>교육 내용</label>
		<input type='text' id='edu_content' name='edu_content' class="eduInsert" value="<%=eduOne.getEdu_content()%>"><br>

		<label>교육 일자</label>
		<input type='date' id='edu_date' name='edu_date' class="eduInsert" value="<%=date%>"><br>

		<label>교육 장소</label>
		<select class="eduInsert" id='edu_place' name='edu_place'>
		<%
			String check1 = "";
			String check2 = "";
			String check3 = "";
			String check4 = "";
			String check5 = "";
			switch(eduOne.getEdu_place()){
			case "피터펫 운동장" : 
				check1 = "checked";
				break;
			case "피터펫 강의실 101호" :
				check2 = "checked";
				break;
			case "피터펫 강의실 102호" :
				check3 = "checked";
				break;
			case "피터펫 강의실 103호" :
				check4 = "checked";
				break;
			case "피터펫 출장 방문" :
				check5 = "checked";
				break;
			}
		%>
			<option value="피터펫 운동장" <%=check1 %>>피터펫 운동장</option>
			<option value="피터펫 강의실 101호" <%=check2 %>>피터펫 강의실 101호</option>
			<option value="피터펫 강의실 102호" <%=check3 %>>피터펫 강의실 102호</option>
			<option value="피터펫 강의실 103호" <%=check4 %>>피터펫 강의실 103호</option>
			<option value="피터펫 출장 방문" <%=check5 %>>출장 방문</option>
		</select><br>

		<label>교육 시간</label>
		<input type='time' id='edu_time' name='edu_time' class="eduInsert" value="<%=eduOne.getEdu_time()%>"><br>

		<label>교육 금액</label>
		<input type='text' id='edu_fee' name='edu_fee' class="eduInsert" value="<%=eduOne.getEdu_fee()%>"><br>

		<label>교육 정원</label>
		<input type='number' id='edu_limit' name='edu_limit' class="eduInsert" min='1' value="<%=eduOne.getEdu_limit()%>"><br>

		<button type='submit'>수정</button>

	</form>
</div>


</body>
</html>
