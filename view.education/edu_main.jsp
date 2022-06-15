<%@page import="kr.or.ddit.pitapet.vo.MemberVO"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="kr.or.ddit.pitapet.vo.EducationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="../edu_js.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/WebContent/WEB-INF/images/logo.png"/>
<title>피터펫(PIT-A-PET)</title>
</head>
<%
	List<EducationVO> eduList = (List<EducationVO>)request.getAttribute("eduList");
	MemberVO loginVO = (MemberVO)session.getAttribute("loginMember");
	String id = loginVO.getMem_id();
// 	String id = "20007AD";
// 	String id = "20007TR";
// 	String id = "20006TR";
	String regex = "[0-9]{1,5}[A-Z]{2}";
	boolean result = Pattern.matches(regex, id);
%>
<script type="text/javascript">
<%-- 			mem_id = '<%=session.getAttribute("id")%>'; --%>
			mem_id = '<%=id%>';
$(function(){
<%-- 	let mem_id = <%=id%>; --%>
	
	//훈련사의 강의 등록
	$('#insertEdu').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Edu_Insert.do"
	})
		
	//훈련사가 등록 신청한, 등록한, 삭제 신청한 강의 관리
	$('#manageEdu').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Edu_Manage.do"
	})
	
	//훈련사의 내 강의 목록 보기
	$('#myEdu').on('click', function(){
		eduList = document.getElementById('eduList');
// 		getMyEdu();
		$.ajax({
			url : '<%=request.getContextPath()%>/Edu_myEdu.do',
			type : 'post',
			data : {"mem_id" : mem_id},
			success : function(res){
				//부모노드(eduList)에 모든 강의(자식 노드)가 없어질 때까지
//  				while(eduList.hasChildNodes()){ 
//  					eduList.removeChild(eduList.childNodes[0]);
//  				}
 				$(eduList).html('');
				code = "";
 				$.each(res, function(i, v){
 					code += '<div class="eduOne" style="display:inline-block">';
 					code += '<img src="images/J.png" style="width : 100px;"><br>';
 					code += '<p style="display : none;">' + v.edu_no +'</p>';
 					code += '<p style="text-align : center;"><a href="/PitAPet/Edu_Detail.do?edu_no=' + v.edu_no + '">' + v.edu_title + '</a></p>';
 					code += '<p style="text-align : center;">' + v.emp_name + '</p>';
 					code += '<p style="text-align : center;">' + v.edu_price + '원</p>';
 					code += '<p style="text-align : center;">모집인원 : ' + v.edu_limit + '명</p>';
 					code += '</div>';
					
 					if((i+1)%3 == 0){
 						code += '<br><br><br>';
 					}
 				})
 				$('#eduList').html(code);
			},
			error : function(xhr){
				alert('상태 : ' + xhr.status);
			},
			dataType : 'json'
		})
	})
	
})
</script>
<body>
<h3> 피터펫 오프라인 강의 소개</h3>
<div id = "eduIntro">
오프라인 강의 사진이나 소개
</div>


<%
	System.out.println("edu main.jsp");

	if(result && id.substring(5).equals("TR")){
%>
		<input type=button value="강의 등록" id = "insertEdu">
		<input type=button value="내 강의 보기" id = "myEdu">
<%
	}else if(result && id.substring(5).equals("AD")){
%>
		<input type=button value="강의 등록" id = "insertEdu">
<%-- 		<button href="<%=request.getContextPath()%>/Edu_Insert.do">강의 등록</button> --%>
		<input type=button value="강의 관리" id = "manageEdu">
<%-- 		<button href="<%=request.getContextPath()%>/Edu_Manage.do">강의 관리</button><br> --%>
<%		
	}
%>

<div id="eduList" >
<%
	if(eduList != null && eduList.size() > 0){
// 	if(eduList == null || eduList.size() == 0){
%>
<%
		int i = 1;
		for(EducationVO vo : eduList){
%>
			<div class="eduOne" style="display:inline-block">
					<img src="images/Better.jpg" style="width : 150px;"><br>
					<p style="display : none"><%=vo.getEdu_no()%></p>
					<p style="text-align : center;"><a href="/PitAPet/Edu_Detail.do?edu_no=<%=vo.getEdu_no()%>" ><%=vo.getEdu_title()%></a></p>
					<p style="text-align : center;"><%=vo.getEmp_name()%></p>
					<p style="text-align : center;"><%=vo.getEdu_price()%>원</p>
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
