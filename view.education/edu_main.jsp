<%@page import="java.util.regex.Pattern"%>
<%@page import="kr.or.ddit.pitapet.vo.EducationVO"%>
<%@page import="java.util.List"%>
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
</head>
<script type="text/javascript">
<%
	List<EducationVO> eduList = (List<EducationVO>)request.getAttribute("eduList");
// 	String id = (String)session.getAttribute("id");
	String id = "12345tr";
// 	String id = "12345ad";
// 	String id = "12345dd";
	String regex = "[0-9]{1,4}[a-z]{3}";
	boolean result = Pattern.matches(regex, id);
	
%>
$(function(){
	
	//선택한 교육글의 번호를 불러와 상세 조회
	$(document).on("click", ".eduOne", function(){
		edu_no = $(this).find("p").eq(0).text();
		console.log(edu_no);
<%-- 		location.href = "<%=request.getContextPath()%>/Edu_Detail.do?edu_no=" + edu_no; --%>
// 		location.href = "http://localhost/pap/Edu_Detail.do?edu_no=" + edu_no;
		
		
		$.ajax({
			url : 'http://localhost/pap/Edu_Detail.do',
			type : 'post',
			data : {"edu_no" : edu_no}
			dataType : 'json',
			success : function(res){
			}
		})
	})
	
	//내 강의 보기 누르면 목록 내 강의들로 새로고침
	$(document).on('click', '#myEdu', function(){
		eduList = $(this).parent().find('#eduList');
// 		eduList = document.querySelector('.eduList');'
		mem_id = <%=id%>
		$.ajax({
			url : 'http://localhost/pap/Edu_Detail.do',
			type : 'get',
			data : {"mem_id" : mem_id}
			dataType : 'json',
			success : function(res){
				while(eduList.hasChildNodes()){ //부모노드(eduList)에 모든 강의(자식 노드)가 없어질 때까지
					eduList.removeChild(eduList.firstChild);
				}
				code = "";
				$.each(res, function(i, v){
					code += '<div class="eduOne" style="display:inline-block">';
					code += '<image src="/WebContent/WEB-INF/images/Better.jpg"><br>';
					code += '<p style="display : none" name = "edu_no">'v.getEdu_no'</p>';
					code += '<p style="text-align : center;">'v.getEdu_title()'</p>';
					code += '<p style="text-align : center;">'v.getEmp_name()'</p>';
					code += '<p style="text-align : center;">'v.getEdu_fee()'원</p>';
					code += '<p style="text-align : center;">모집인원 : 'v.getEdu_limit()'명</p>';
					code += '</div>';
				})
				$(code).appendTo(eduList);
				
			}
		})
	})
	
	
	//공지사항 등록
	$(document).on("click", "#reg", function(){
		location.href = "/PitAPet/GoInsertNotice.do?";	
		href="<%=request.getContextPath()%>/Edu_Detail.do"
	})
})
</script>
<body>
<h3> 피터펫 오프라인 강의 소개</h3>
<div id = "eduIntro">
오프라인 강의 사진이나 소개
</div>


<%
	if(id.substring(5).equals("tr")){
%>
		<button href="<%=request.getContextPath()%>/Edu_Insert.do">강의 등록</button><button id = "myEdu">내 강의 보기</button><br>
<%
	}if(id.substring(5).equals("ad")){
%>
		<button href="<%=request.getContextPath()%>/Edu_Insert.do">강의 등록</button><button id = "eduMng">강의 관리</button><br>
<%		
	}
%>

<div id="eduList" name = "eduList">
<%
	if(eduList != null && eduList.size() > 0){
// 	if(eduList == null || eduList.size() == 0){
%>
<%
		int i = 1;
		for(EducationVO vo : eduList){
%>
			<div class="eduOne" style="display:inline-block">
					<image src="/WebContent/WEB-INF/images/Better.jpg"><br>
					<p style="display : none" name = "edu_no"><%=vo.getEdu_no()%></p>
					<p style="text-align : center;"><%=vo.getEdu_title()%></p>
					<p style="text-align : center;"><%=vo.getEmp_name()%></p>
					<p style="text-align : center;"><%=vo.getEdu_fee()%>원</p>
					<p style="text-align : center;">모집인원 : <%=vo.getEdu_limit()%>명</p>
			</div>
<%
			if(i%3 == 0){
%>
				<br><br><br>
<%
			}
			i++;
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
