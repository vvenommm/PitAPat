<%@page import="kr.or.ddit.pitapet.vo.EducationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../include/header.jsp" ></jsp:include>

<%
	List<EducationVO> eduList = (List<EducationVO>)request.getAttribute("eduList");
%>


<div id="eduBody">
<div id="eduList" name = "eduList">
	<table border="1">
		<tr>
			<td style="display : none">교육 코드</td>
			<td>글번호</td>
			<td>교육 제목</td>
			<td>교육 담당자</td>
			<td>교육 일시</td>
			<td>교육 장소</td>
			<td>교육 가격</td>
			<td>교육 인원</td>
			<td>교육 상태</td>
			<td>상태 변경</td>
		</tr>
<%
	if(eduList != null && eduList.size() > 0){
		int i = 1;
		for(EducationVO vo : eduList){
%>
			<tr>
				<td style="display : none"><%=vo.getEdu_no() %></td>
				<td><%=i %></td>
				<td><%=vo.getEdu_title() %></td>
				<td><%=vo.getEmp_id() %></td>
				<td><%=vo.getEdu_date() %> <%=vo.getEdu_time() %></td>
				<td><%=vo.getEdu_place() %></td>
				<td><%=vo.getEdu_price() %></td>
				<td><%=vo.getEdu_limit() %></td>
				<td><%=vo.getEdu_status() %></td>
				<td><button class="apprv">승인</button><button class="apprv">비승인</button></td>
			</tr>
<%
			i++;
		}
%>



<%
}else{
%>
		<tr>
			<td style="display : none">없음</td>
			<td colespan="9">등록된 수업이 없습니다.</td>
		</tr>
<%
	}
%>
	</table>
</div>
</div>

<jsp:include page="../../include/footer.jsp" ></jsp:include>
