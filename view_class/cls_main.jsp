<%@page import="kr.or.ddit.pitapet.vo.MemberVO"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="kr.or.ddit.pitapet.vo.ClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../include/header.jsp" ></jsp:include>

<%
	List<ClassVO> packList = (List<ClassVO>)request.getAttribute("packList");
	List<ClassVO> countList = (List<ClassVO>)request.getAttribute("countList");
	
	String id = (String)session.getAttribute("id");
	if(id == null){
		id = "";
	}
	String regex = "[0-9]{1,5}[A-Z]{2}";
	boolean result = Pattern.matches(regex, id);
%>

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


<!-- //////////////////////////////////////////////////시작//////////////////////////////////////////////////// -->


<div id="clsBody">
<div id="cls_h3">
<h3 id="cls_h3_text">온라인 강의</h3>
</div>

<div id="cls_intro">
	<span style="font-weight : bold; font-family: 'Do Hyeon', sans-serif; font-size : 1.5em;">"언제 어디서나 공부한다!" 강의 패키지</span><br><br>영상강의 시청만을 위한 패키지입니다. 그룹/개인 대면 교육은 오프라인 교육에서 확인 가능합니다.
</div>

<br><br>


<%
	System.out.println("cls main.jsp");

	if(result && id.substring(5).equals("TR")){
%>
	<div id="cls_btn_div">
		<input type=button value="강의 등록" id = "insertCls" class="cls_btn">
		<input type=button value="내 강의 보기" id = "myCls" class="cls_btn">
	</div>
<%
	}if(result && id.substring(5).equals("AD")){
%>
	<div id="cls_btn_div">
		<input type=button value="강의 등록" id = "insertCls" class="cls_btn">
		<input type=button value="강의 관리" id = "manageCls" class="cls_btn">
	</div>
<%		
	}
%>


<br><br><br><br>

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
			</tr>
			<tr>
				<td colspan="2" style="text-align : right;">강사 : <%=vo.getEmp_name()%></td>
			</tr>
			<tr>
				<td colspan="2"><%=vo.getCls_content()%></td>
			</tr>
			<tr>
				<td>총 <%=vo2.getCls_count()%>강</td>
				<td style="text-align : right;"><%=vo.getCls_price()%>원</td>
			</tr>
				<%		
					}
				}%>
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
</div>
<jsp:include page="../../include/footer.jsp" ></jsp:include>
