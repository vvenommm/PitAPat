<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="kr.or.ddit.pitapet.vo.EducationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../include/header.jsp" ></jsp:include>

<%
	EducationVO eduOne = (EducationVO)request.getAttribute("eduOne");

//아이디 검증////////////////////////////////////////////////////
String id = (String)session.getAttribute("id");
	if(id == null){
		id = "";
	}
	String regex = "[0-9]{1,5}[A-Z]{2}";
	boolean result = Pattern.matches(regex, id);
	////////////////////////////////////////////////////////////////
%>

<script type="text/javascript">
$(function(){
	edu_no = "<%=eduOne.getEdu_no()%>";

	//장바구니에 넣기
	$('#getInCart').on('click', function(){
		if(mem_id.equals("")){
			alert('로그인 후 이용 가능합니다.');
		}else{
		<%
			//오늘날짜 yyyy-MM-dd로 생성
			String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		
			//yyyy-MM-dd 포맷 설정
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			//비교할 date와 today를 데이터 포맷으로 변경
			Date eduDay = new Date(dateFormat.parse(eduOne.getEdu_date()).getTime()); 
			Date today = new Date(dateFormat.parse(todayfm).getTime()); //오늘
			
			//compareTo메서드를 통한 날짜비교
			int compare = eduDay.compareTo(today); 
			 
			//조건문
			if(compare > 0) { //date가 today보다 큽니다.(date > today)
		%>
		
			$.ajax({
				url : 'http://localhost/PitAPet/Edu_intoCart.do',
				type : 'post',
				data : {"edu_no" : edu_no},
				success : function(res){
					if(res == 1){
 						alert(res.sw);
					}else{
 						alert(res.sw);
					}
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			});
		<%
			}
		%>
		}
	})
	
	//훈련사의 강의 수정 누르면 수정 창으로 이동 
	$('#editEdu').on('click', function(){
		location.href="<%=request.getContextPath()%>/Edu_Edit.do?edu_no=<%=eduOne.getEdu_no()%>";
	})
		

	//훈련사의 강의 삭제
	$('#deleteEdu').on('click', function(){
		let text = '해당 강의를 삭제하시겠습니까?';
		if(confirm(text) == true){
			location.href = "<%=request.getContextPath()%>/Edu_Delete.do?edu_no=<%=eduOne.getEdu_no()%>";
		}
	})
	
	//다시 글목록으로
	$('#backToList').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Cls_Main.do";
	})
	
})
</script>

<div id="eduBody">

<%
	System.out.println("edu_detail.jsp");
	
	System.out.println(id + " : " + result);
	if(result && id.substring(5).equals("AD")){ //관리자일 때
		
%>
	<input type=button value="강의 수정" id = "editEdu">
	<input type=button value="강의 삭제" id = "deleteEdu"><br>
<%
	}else if(result && id.substring(5).equals("TR")&&id.equals(eduOne.getEmp_id())){ //훈련사 본인 글일 때
%>
	<input type=button value="강의 수정" id = "editEdu">
	<input type=button value="강의 삭제" id = "deleteEdu"><br>
<%
	}
%>



	<div class="eduOne" style="display:inline-block">
<table border="1">
	<tr>
		<td colspan="4">
		
			<img src="images/Better.jpg">
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="4">
			<%=eduOne.getEdu_title()%>
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="4">
			훈련사 <%=eduOne.getEmp_name()%>
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="2">
		<%=eduOne.getEdu_date2()%>
		</td>
		<td>
		<%=eduOne.getEdu_time()%>
		</td>
		<td>
			<%=eduOne.getEdu_place()%>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<%=eduOne.getEdu_content()%>
		</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="2">
			모집인원 : <%=eduOne.getEdu_limit()%>명
		</td>
		<td colspan="2">
			<%=eduOne.getEdu_price()%>원
		</td>
	</tr>
	<tr style="display : none" >
		<td colspan="4" style="display : none" >
			<p style="display : none" name = "edu_no"><%=eduOne.getEdu_no()%></p>
		</td>
	</tr>
</table>
	</div><br>
	<input type="button" id="getInCart" value="장바구니 담기">
</div>

<jsp:include page="../../include/footer.jsp" ></jsp:include>
