<%@page import="kr.or.ddit.pitapet.vo.DogVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../include/header.jsp" ></jsp:include>
<%
	List<DogVO> dogList = (List<DogVO>)request.getAttribute("dogList");
	
//String dog_bir = dogList.get(i).getDog_bir.substring(0, 10);

%>
<style>
#insertDogInfo{
	margin-top : 20%;
	margin-left : 10%;
	margin-right : 10%;
	min-height: 600px;
}
#insertBody{
	display : none;
}
</style>
<script type="text/javascript">
$(function(){
	$('#selectDog').on('change',function(){
		var dogNo = $(this).val();
		$('#insertBody').show();
		if(dogNo=="newDog"){
			$('#dogNo').val("");
			$('#dogName').val("");
			$('#dogType').val("");
			$('#dogGender').val("");
// 			$('#dogBir').val(""),
			$('#dogSur').val("");
			$('#dogVa').val("");
			$('#dogAl').val("");
			$('#dogEtc').val("");
			return;
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/Cart_dogInfo.do",	
			type : "post",
			data : {"dogNo" : dogNo },
			dataType : "json",
			
			success : function(res){//jsontype만들어서 오기
				$('#dogNo').val("");
				$('#dogName').val("");
				$('#dogType').val("");
					$('#dg').prop("checked",false);
					$('#dm').prop("checked",false);
// 				$('#dogBir').val(""),
					$('#dogSur').prop("checked",false);
					$('#dogVa').prop("checked",false);
					$('#dogAl').prop("checked",false);
				$('#dogEtc').val("");

				
				$('#dogNo').val(res.dogNo);
				$('#dogName').val(res.dogName);
				$('#dogType').val(res.dogType);
				$('#dogBir').val(res.dogBir.substring(0, 10));
				
				if(res.dogGender=="암컷"){
					$('#dg').prop("checked",true);
				}else{
					$('#dm').prop("checked",true);
				}
				
				if(res.dogSur == "Y"){
					$('#dogSur').prop("checked",true);
				}
				
				if(res.dogVa == "Y"){
					$('#dogVa').prop("checked",true);
				}
				
				if(res.dogAl == "Y"){
					$('#dogAl').prop("checked",true);
				}		
				
				if(res.dogEtc == null) $('#dogEtc').val("없음"); else $('#dogEtc').val(res.dogEtc);
			},
			error : function(xhr){
				alert("상태 : "+xhr.status);
			}
		})
	})
	
	//정규화
	//강아지 등록번호
	$('#dogNo').on('keyup',function(){
		dogNoVal = $(this).val().trim();
		
		dogNoReg = /^[0-9]{15}$/	//강아지 등록번호 숫자 15글자 정규식
		
		if(!(dogNoReg.test(dogNoVal))){
		$(this).css('border','1px solid red');
		return false;			
		}else{
		$(this).css('border','1px solid blue');
		}
	})
	//강아지 이름
	$('#dogName').on('keyup',function(){
		dogNameVal = $(this).val().trim();
		if(!(dogNameVal)){
			$(this).css('border','1px solid red');
			return false;
		}else{
			$(this).css('border','1px solid blue');
		}
	})
	//강아지 타입
	$('#dogType').on('keyup',function(){
		dogTypeVal = $(this).val().trim();
		if(!(dogTypeVal)){
			$(this).css('border','1px solid red');
			return false;
		}else{
			$(this).css('border','1px solid blue');
		}
	})
	
})

function sendInfo(){
	newDog = $('#selectDog').val();//새로운 강아지등록
	if(newDog == "newDog"){//강아지등록
		dog = "newDog";
		//개 정보 insert
    	$.ajax({
			url:  "<%=request.getContextPath()%>/Cart_inNupDogInfo.do",
			type : 'post',
			data : {
					"dog" : dog,
					"dogNo": $('#dogNo').val(),
					"dogName": $('#dogName').val(),
// 					"dogBir" : $('#dogBir').val(),
					"dogType": $('#dogType').val(),
					"dogGender" : $('.dogGender:checked').val(),
					"dogSur" : $('#dogSur').val(),//check박스
					"dogVa" : $('#dogVa').val(),//check박스
					"dogAl" : $('#dogAl').val(),//check박스
					"dogEtc" : $('#dogEtc').html()
			},
			success : function(res){ //성공 시 홈으로
				window.close();
			},error : function(xhr){
				alert("상태 : "+xhr.status);//성공하면 지우기
			},
			dataType : 'json'
		});
	}else{
		//기존 강아지 업데이트
		dog = "notNewDog";
		//개 정보 insert
    	$.ajax({
			url:  "<%=request.getContextPath()%>/Cart_inNupDogInfo.do",
			type : 'get',
			data : {
					"dog" : dog,
					"dogNo": $('#dogNo').val(),
					"dogName": $('#dogName').val(),
					"dogType": $('#dogType').val(),
					"dogGender" : $('.dogGender:checked').val(),//check박스
// 					"dogBir" : $('#dogBir').val(),
					"dogSur" : $('#dogSur').val(),//check박스
					"dogVa" : $('#dogVa').val(),//check박스
					"dogAl" : $('#dogAl').val(),//check박스
					"dogEtc" : $('#dogEtc').html()
			},
			success : function(res){
				window.close();
			},error : function(xhr){
				alert("상태 : "+xhr.status);//성공하면 지우기
			},
			dataType : 'json'
		});
	}
}
</script>


<div id="insertDogInfo">
	<h4>---- 선택해주세요 ----</h4>
<select id = "selectDog">
	<option>선택하기</option>
	<option value = "newDog">강아지 새 정보 등록</option>
<%
	if(dogList != null && dogList.size()>0){	//등록되어있는 강아지가 있을 때
		for(DogVO vo : dogList){
%>	
			<option value = <%=vo.getDog_no() %>><%=vo.getDog_name() %></option>
<% 
	}
}
%>
	</select>
	<br><hr><br><br>
	<div id = "insertBody">


<!-- 	<label>강아지 사진</label> -->
<!-- 		<input type="file" id="dogPic" name="dog_pic"><br> -->

	<label for = "dogNo">강아지 등록번호</label>
		<input type="text" name = "dogNo" id="dogNo"><br>
	
	<label for = "dogName">강아지 이름</label>
		<input type="text" name="dogName" id="dogName"><br>
	
	<label>강아지 품종</label>
		<input type="text" name="dogType" id="dogType"><br>
	
	<label>강아지 성별</label>
		<input type="radio" value="수컷" class="dogGender" name="dogGender" id="dm">수컷
  		<input type="radio" value="암컷" class="dogGender" name="dogGender" id="dg" >암컷<br>
  		
<!--   	<label>강아지 생일</label> -->
<!-- 		<input type="date" id="dogBir"><br> -->

	<label>강아지 중성화 여부</label>
		<input type="checkbox" name = "dogSur"id = "dogSur"><br>

	<label>강아지 광견병 접종 여부</label>
		<input type="checkbox" name = "dogVa" id = "dogVa"><br>

	<label>강아지 알러지 여부</label>
		<input type="checkbox" name = "dogAl" id = "dogAl"><br>
	
	<label>강아지 특이사항</label><br>
		<textarea name="dogEtc" id="dogEtc" class="form-control" cols="30" rows="6"></textarea>
		
	<input type="button" value="확인" onclick="sendInfo()">
	</div>
</div>

<jsp:include page="../../include/footer.jsp" ></jsp:include>
