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
<script type="text/javascript">
$(function(){
	num = 0;
	$('#btn_plus').on('click', function(){
		num = num+1;
		
		code = "";
		code += '<label>개별 강의 제목</label>';
		code += '<input type="text" id="cls_title' + num + '" name="cls_title" class="clsInsert"><br>';		
		code += '<label>해당 강의 링크</label>';
		code += '<input type="text" id="cls_link' + num + '" name='cls_link' class="clsInsert"><br>';
		
		alert(num);
		$('.clsLink').html(code);
	})
	
	
	
	
	
	
	
	
})
</script>

<div id='cls_insert_div'>
	<form action="/PitAPet/Cls_Insert.do" method="post">
		<label>교육 주제(패키지명)</label>
		<input type='text' id='cls_title' name='cls_title' class="clsInsert"><br>

		<label>교육 내용</label>
		<input type='text' id='cls_content' name='cls_content' class="clsInsert"><br>

		<label>교육 등급</label>
		<select class="clsInsert" id='cls_class' name='cls_class'>
			<option value="a">초급</option>
			<option value="i">중급</option>
			<option value="f">고급</option>
			<option value="s">심화</option>
			<option value="z">기타</option>
		</select><br>

		<label>교육 금액</label>
		<input type='text' id='edu_fee' name='edu_fee' class="clsInsert"><br>
		
		<button id="btn_plus" value="plus">추가</button>
		<button id="btn_minus" value="minus">삭제</button>

		<div class="clsLink">
			
		</div>

		<button type='submit'>등록</button>

	</form>
</div>

<jsp:include page="../../include/footer.jsp" ></jsp:include>
