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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
<script type="text/javascript">
$(function(){
	//훈련사의 강의 등록
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
		mem_id = "<%=id%>";
// 		getMyEdu();
		$.ajax({
			url : '<%=request.getContextPath()%>/Cls_myCls.do',
			type : 'post',
			data : {"mem_id" : mem_id},
			success : function(res){
				//부모노드(eduList)에 모든 강의(자식 노드)가 없어질 때까지
//  				while(eduList.hasChildNodes()){ 
//  					eduList.removeChild(eduList.childNodes[0]);
//  				}
 				$(clsList).html('');
				code = "";
 				$.each(res, function(i, v){
 					code += '<div class="clsDiv"><table border="1" class="clsOne">';
 					code += '<tr><td rowspan="4"><img src="images/J.png" style="width : 150px;"><br><p style="display : none">' + v.cls_no + '</p></td>';
 					code += '<td><a href="/PitAPet/Cls_Detail.do?cls_subcode=' + vo.cls_subcode + '">' + v.cls_subject + '</a></td>';
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
</head>
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
		<div class="clsDiv">
			<table border="1" class="clsOne" >
			<tr>
				<td rowspan="4">
					<img src="images/J.png" style="width : 150px;"><br>
					<p style="display : none"><%=vo.getCls_no()%></p>
				</td>
				<td>
					<a href="/PitAPet/Cls_Detail.do?cls_subcode=<%=vo.getCls_subcode()%>"><%=vo.getCls_subject()%></a>
				</td>
				<td style="text-align : right;">총 <%=vo.getCls_count()%>강</td>
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
