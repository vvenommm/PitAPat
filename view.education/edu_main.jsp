<%@page import="kr.or.ddit.pitapet.vo.MemberVO"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="kr.or.ddit.pitapet.vo.EducationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../../include/header.jsp" ></jsp:include>
<%
	List<EducationVO> eduList = (List<EducationVO>)request.getAttribute("eduList");
	String id = (String)session.getAttribute("id");
	if(id == null){
		id = "";
	}
	String regex = "[0-9]{1,5}[A-Z]{2}";
	boolean result = Pattern.matches(regex, id);
%>
<script type="text/javascript">
	mem_id = "<%=id%>";
$(function(){
	
// 	훈련사의 강의 등록
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
		$.ajax({
			url : '<%=request.getContextPath()%>/Edu_myEdu.do',
			type : 'post',
			data : {"mem_id" : mem_id},
			success : function(res){
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


<div id="eduBody">
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
		<input type=button value="강의 관리" id = "manageEdu">
<%		
	}
%>

<div id="eduList" >
<%
	if(eduList != null && eduList.size() > 0){
%>
<%
		int i = 1;
		for(EducationVO vo : eduList){
%>
			<div class="eduOne" style="display:inline-block">
					<img src="images/<%=vo.getEmp_id() %>.jpg" style="width : 150px;"><br>
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
</div>
<jsp:include page="../../include/footer.jsp" ></jsp:include>
