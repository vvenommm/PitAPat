<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="../../include/header.jsp" ></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	
%>
<script type="text/javascript">
$(function(){
	
	//강의와 링크 추가하기
	num = 0;
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
	
	//입력값 ajax로 insert
	$('#clsSubmit').on('click', function(){
		
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
			url : '<%=request.getContextPath()%>/Cls_Insert.do',
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
})
</script>
<body>

	<div id='cls_insert_div'>
		<label>교육 주제(패키지명)</label>
		<input type='text' id='clsSubject' name='cls_subject' class="clsInsert"><br>

		<label>교육 내용</label>
		<input type='text' id='clsContent' name='cls_content' class="clsInsert"><br>

<!-- 		<label>교육 등급</label> -->
<!-- 		<select class="clsInsert" id='clsSubcode' name='cls_subcode'> -->
<!-- 			<option value="a">초급</option> -->
<!-- 			<option value="i">중급</option> -->
<!-- 			<option value="f">고급</option> -->
<!-- 			<option value="s">심화</option> -->
<!-- 			<option value="z">기타</option> -->
<!-- 		</select><br> -->

		<label>교육 금액</label>
		<input type='text' id='clsFee' name='cls_fee' class="clsInsert"><br>
		
		<div id="clsAdd" class="cls_add">
			<button id="btn_plus" value="plus">추가</button>
			<button id="btn_minus" value="minus">삭제</button><br>
		</div>

		<button id='clsSubmit'>등록</button>

	</div>

</body>
</html>
<jsp:include page="../../include/footer.jsp" ></jsp:include>
