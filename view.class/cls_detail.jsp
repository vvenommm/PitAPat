<%@page import="java.util.List"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="kr.or.ddit.pitapet.vo.ClassVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../include/header.jsp" ></jsp:include>

<%
	List<ClassVO> clsOneList = (List<ClassVO>)request.getAttribute("clsOne");
	int cls_count = (int)request.getAttribute("cls_count");

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
	
	//훈련사의 강의 수정
	$('#editCls').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Cls_Edit.do?cls_subject=<%=clsOneList.get(0).getCls_subject()%>&cls_count=<%=cls_count%>";
	})
	
	//훈련사의 강의 삭제
	$('#deleteCls').on('click', function(){
		let text = '해당 강의를 삭제하시겠습니까?';
		if(confirm(text) == true){
			location.href = "<%=request.getContextPath()%>/Cls_Delete.do?cls_subject=<%=clsOneList.get(0).getCls_subject()%>&cls_count=<%=cls_count%>";
		}
		
	})

	//다시 글목록으로
	$('#backToList').on('click', function(){
		location.href = "<%=request.getContextPath()%>/Cls_Main.do";
	})
	
	//장바구니에 넣기
	$('#getInCart').on('click', function(){
		cls_subject="<%=clsOneList.get(0).getCls_subject()%>";
		id = "<%=id%>";
		if(id == ""){
			alert('로그인 후 이용 가능합니다.');
		}else{
			$.ajax({
				url : '<%=request.getContextPath()%>/Cls_intoCart.do',
				type : 'post',
				data : {"cls_subject" : cls_subject},
				success : function(res){
					if(res == 1){
 						alert(res.sw);
					}else{
 						alert(res.sw);
					}
				},
				error : function(xhr){
					alert('상태 : ' + xhr.status);
				},
				dataType : 'json'
			})
		}
	})
	
})
</script>
<div id="clsBody">
<div>you are on cls_detail.jsp</div>

<%
	System.out.println("cls_detail.jsp");
	
	System.out.println(id + "와" + result);
	if(result && id.substring(5).equals("AD")){ //관리자일 때
%>
	<input type=button value="강의 수정" id = "editCls">
	<input type=button value="강의 삭제" id = "deleteCls"><br>
<%
	}else if(result && id.substring(5).equals("TR")&&id.equals(clsOneList.get(0).getEmp_id())){ //훈련사 본인 글일 때
%>
	<input type=button value="강의 수정" id = "editCls">
	<input type=button value="강의 삭제" id = "deleteCls"><br>
<%
	}
%>
	
	<input type=button value="목록 보기" id = "backToList"><br>
	<div class="clsOne" style="display:inline-block">
		<p style="display : none" id = "cls_no"><%=clsOneList.get(0).getCls_no()%></p>

<table border="1" id="tab">
	<tr>
		<td colspan="3" rowspan="6">
			<img src="images/J.png" style="width : 150px;">
		</td>
		<td>주제</td>
		<td colspan="2"><%=clsOneList.get(0).getCls_subject() %></td>
	</tr>
	<tr>
		<td>강의자</td>
		<td colspan="2"><%=clsOneList.get(0).getEmp_name() %></td>
	</tr>
	<tr>
		<td>가격</td>
		<td colspan ="2"><%=clsOneList.get(0).getCls_price() %>원</td>
	</tr>
	<tr>
		<td>
		내용
		</td>
		<td colspan="3" rowspan="3">
		<%=clsOneList.get(0).getCls_content() %>
		</td>
	</tr>
	<tr></tr>
	<tr></tr>
	<%
	if(clsOneList != null && clsOneList.size() > 0){
		for(int i = 0; i < clsOneList.size(); i++){
	%>
		<tr><td colspan="6"><%=clsOneList.get(i).getCls_title()%></td></tr>
	
	<%	
		}
	}
	%>
	<tr><td colspan="6" style="text-align : right;">총 <%=cls_count%>강</td></tr>
</table>
</div><br>

	<input type="button" id="getInCart" value="장바구니 담기">

</div>
<jsp:include page="../../include/footer.jsp" ></jsp:include>
