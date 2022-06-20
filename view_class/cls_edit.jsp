<%@page import="kr.or.ddit.pitapet.vo.ClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../include/header.jsp" ></jsp:include>
<style>
	label{
		display: inline-block;
		width: 190px;
	}
	.clsInsert{
		width: 300px;
	}
</style>
<%
	List<ClassVO> clsOneList = (List<ClassVO>)request.getAttribute("clsOne");
	int cls_count = (int)request.getAttribute("cls_count");
%>
<script type="text/javascript">
$(function(){
	
	//수정한 정보 update하기
	$('#clsEditSubmit').on('click', function(){
		//배열 생성
		arr = new Array(num);

		let cls_subject = $('#clsSubject').val();
		let cls_content = $('#clsContent').val();
		let cls_class = $('#clsClass').val();
		let cls_fee = $('#clsFee').val();
		
		for(i = 0; i < num; i++){
			let title = "#clsTitle" + (i+1);
			let path = "#clsPath" + (i+1);
			
			let cls_title = $(title).val();
			let cls_path = $(path).val();
			
			arr[i] = "{'cls_subject': \"" + cls_subject + "\", 'cls_content':\"" +  cls_content + "\", 'cls_fee':" +  cls_fee + ", 'cls_title':\"" +  cls_title + "\", 'cls_path':\"" +  cls_path + "\" }";
		}
		
		$.ajax({
			url : '<%=request.getContextPath()%>/Cls_Edit.do',
			type : 'post',
			data : {"arr" : arr},
			success : function(res){
 				alert(res.sw);
 				location.href="<%=request.getContextPath()%>/Cls_Main.do";
			},
			error : function(xhr){
				alert('상태 : ' + xhr.status);
			},
			dataType : 'json'
		})
	
	})
	
	
	
	//강의와 링크 추가하기
	num = <%=cls_count%>;
	$('#btn_plus').on('click', function(){
		num = num+1;
		
		let code = '';
		code += '<div class ="added">';
		code += '<label>개별 강의 제목</label>';
		code += '<input type="text" id="clsTitle' + num + '" name="cls_title' + num + '" class="clsInsert"><br>';		
		code += '<label>해당 강의 링크</label>';
		code += '<input type="text" id="clsPath' + num + '" name="cls_path' + num + '" class="clsInsert"><br>';
		code += '</div>';
		
// 		alert(num);
		$('#clsAdd').append(code);
	})
	
	//강의와 링크 삭제하기
	$('#btn_minus').on('click', function(){
		prt = $(this).parent().find('#added').remove();
		num = num-1;
	})
})
</script>

	<div id='cls_insert_div'>

		<label>교육 주제(패키지명)</label>
		<input type='text' id='clsSubject' name='cls_subject' class="clsInsert" value="<%=clsOneList.get(0).getCls_subject()%>"><br>

		<label>교육 내용</label>
		<input type='text' id='clsContent' name='cls_content' class="clsInsert" value="<%=clsOneList.get(0).getCls_content()%>"><br>

		<label>교육 금액</label>
		<input type='text' id='clsFee' name='cls_fee' class="clsInsert" value="<%=clsOneList.get(0).getCls_fee()%>"><br><br>
		
		<div id="clsAdd" class="cls_add">
			<button id="btn_plus" value="plus">추가</button>
			<button id="btn_minus" value="minus">삭제</button><br>
	<%
		for(int i = 0; i < cls_count; i++){
	%>
		<input type='text' id='clsNo<%=i+1 %>' name='cls_no' class="clsInsert" value="<%=clsOneList.get(i).getCls_no()%>" style="display : none">
		
		<div class ="added">
		<label>개별 강의 제목</label>
		<input type="text" id="clsTitle<%=i+1%>" name="cls_title<%=i+1%>"" class="clsInsert" value="<%=clsOneList.get(i).getCls_title()%>"><br>
		<label>해당 강의 링크</label>
		<input type="text" id="clsPath<%=i+1%>" name="cls_path<%=i+1%>"" class="clsInsert" value="<%=clsOneList.get(i).getCls_path()%>"><br>
		</div>
	<%		
		}	
	%>
		</div>
		<br><br>
		<button id='clsEditSubmit'>수정</button>

	</div>

<jsp:include page="../../include/footer.jsp" ></jsp:include>
