<%@page import="kr.or.ddit.pitapet.vo.MemberVO"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="kr.or.ddit.pitapet.vo.ClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:include page="../../include/header.jsp" ></jsp:include> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%
	List<ClassVO> packList = (List<ClassVO>)request.getAttribute("packList");
	List<ClassVO> countList = (List<ClassVO>)request.getAttribute("countList");
	MemberVO memVO = (MemberVO)session.getAttribute("loginMember");
	String id = memVO.getMem_id();
// 	String id = "20007AD";
// 	String id = "20007TR";
// 	String id = "20006TR";
	String regex = "[0-9]{1,5}[A-Z]{2}";
	boolean result = Pattern.matches(regex, id);
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
$(function(){
	//훈련사의 강의 등록하러 가기
	$('#insertCls').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Cls_Insert.do"
	})
		
	//훈련사가 등록 신청한, 등록한, 삭제 신청한 강의 관리
	$('#manageCls').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Cls_Manage.do"
	})
	
	//훈련사의 내 강의 목록 보기
	$('#myCls').on('click', function(){
		clsList = document.getElementById('clsList');
// 		getMyEdu();
		$.ajax({
			url : '<%=request.getContextPath()%>/Cls_myCls.do',
			type : 'post',
			success : function(res){
 				$(clsList).html('');
				let code = "";
 				$.each(res, function(i, v){
 					code += '<div class="clsDiv"><table border="1" class="clsOne">';
 					code += '<tr><td rowspan="4"><img src="images/J.png" style="width : 150px;"><br></td>';
 					code += '<td><a href="/PitAPet/Cls_Detail.do?cls_subject=' + v.cls_subject + '&cls_count=' + v.cls_count + '">' + v.cls_subject + '</a></td>';
 					code += '<td style="text-align : right;">총 ' + v.cls_count + '강</td></tr>';
 					code += '<tr><td colspan="2" style="text-align : right;">강사 : ' + v.emp_name + '</td></tr>';
 					code += '<tr><td colspan="2">' + v.cls_content + '</td></tr>';
 					code += '<tr><td colspan="2" style="text-align : right;">' + v.cls_price + '원</td></tr>';
 					code += '</table></div><br>';
					
 				})
 				$('#clsList').html(code);
			},
			error : function(xhr){
				alert('상태 : ' + xhr.status);
			},
			dataType : 'json'
		})
	})
})
</script>
<style>
nav{
	padding-bottom: 500px;
}
</style>
<body>

<h3>온라인 강의</h3>

<div>
	온라인 강의 소개하는 곳
</div>

<%
	System.out.println("cls main.jsp");

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

<div id="clsIntro">
	<h4>영상강의만을 위한 패키지입니다. 오프라인 개인 교육 및 세미나 등은 회원 가입 후 가능합니다.</h4>
</div>

<div id="clsList" >
<%
System.out.println(packList);
	if(packList != null && packList.size() > 0){
%>
<%
		int i = 1;
		for(ClassVO vo : packList){
%>
		<div class="clsDiv">
			<table border="1" class="clsOne" >
			<tr>
				<td rowspan="4">
					<img src="images/J.png" style="width : 150px;"><br>
					<p style="display : none"><%=vo.getCls_no()%></p>
				</td>
				<%for(ClassVO vo2 : countList){
					if(vo.getCls_subject().equals(vo2.getCls_subject())){
				%>
				<td>
					<a href="/PitAPet/Cls_Detail.do?cls_subject=<%=vo.getCls_subject()%>&cls_count=<%=vo2.getCls_count()%>"><%=vo.getCls_subject()%></a>
				</td>
					<td style="text-align : right;">총 <%=vo2.getCls_count()%>강</td>
				<%		
					}
				}%>
			</tr>
			<tr>
				<td colspan="2" style="text-align : right;">강사 : <%=vo.getEmp_name()%></td>
			</tr>
			<tr>
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
<jsp:include page="../../include/footer.jsp" ></jsp:include>
