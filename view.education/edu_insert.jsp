<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../include/header.jsp" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<div id='edu_insert_div'>
	<form action="/PitAPet/Edu_Insert.do" method="post">
		<label>교육 제목</label>
		<input type='text' id='edu_title' name='edu_title' class="eduInsert"><br>

		<label>교육 내용</label>
		<input type='text' id='edu_content' name='edu_content' class="eduInsert"><br>

<% 
   LocalDate now = LocalDate.now(); 
   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");   
   String today = now.format(formatter); 
%>
		<label>교육 일자</label>
		<input type='date' id='edu_date' name='edu_date' min="<%=today%>" class="eduInsert"><br>

		<label>교육 장소</label>
		<select class="eduInsert" id='edu_place' name='edu_place'>
			<option value="피터펫 운동장">피터펫 운동장</option>
			<option value="피터펫 강의실 101호">피터펫 강의실 101호</option>
			<option value="피터펫 강의실 102호">피터펫 강의실 102호</option>
			<option value="피터펫 강의실 103호">피터펫 강의실 103호</option>
			<option value="피터펫 출장 방문">출장 방문</option>
		</select><br>

		<label>교육 시간</label>
		<input type='time' id='edu_time' name='edu_time' class="eduInsert"><br>

		<label>교육 금액</label>
		<input type='text' id='edu_fee' name='edu_fee' class="eduInsert"><br>

		<label>교육 정원</label>
		<input type='number' id='edu_limit' name='edu_limit' class="eduInsert" min='1'><br>

		<button type='submit'>등록 신청</button>

	</form>
</div>

</body>
</html>
<jsp:include page="../../include/footer.jsp" ></jsp:include>
