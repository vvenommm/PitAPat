<%@page import="kr.or.ddit.pitapet.vo.EmployeeVO"%>
<%@page import="kr.or.ddit.pitapet.vo.MemberVO"%>
<%@page import="kr.or.ddit.pitapet.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../../include/header.jsp"></jsp:include>
    
    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
 .tab1 {
 	margin : 30px;
 	width : 800px;
 }
 .cart {
 	margin-top : 100px;
 	float : left;
 	border : 1px solid red;
 }
 .sum {
	width : 150px;
 	margin-top : 100px;
	float : right;
 	width : calc(30%-1px);
 	border : 1px solid red;
 }
 .fee {
 	text-align : right;
 }
 
 .button{
	border : 1px solid #ff8c00;
	border-radius : 20px;
 	margin-right : 50px;
 	width : 150px;
 	height : 40px;
 	font-family: 'Do Hyeon', sans-serif;
 	color : orange;
 	background: white;
 }
 
 .button:hover{
  	background-color : orange;
 	color : white;
 }
 
 #dogButton{
/*  	display : none; */
	border : 1px solid #FF6A89;
	border-radius : 20px;
 	margin-right : 50px;
 	width : 150px;
 	height : 40px;
 	font-family: 'Do Hyeon', sans-serif;
 	color : orange;
 	background: white;
 }
 
 #dogButton:hover{
  	background-color : #FF6A89;
 	color : white;
 }
 #cartBody{
	margin-top : 15%;
 	margin-left : 10%;
	margin-right : 10%;
	min-height: 800px;
 }
</style>


<%
		//장바구니 리스트 가져오기
		List<CartVO> cartList = (List<CartVO>)request.getAttribute("cartList");
		CartVO count = (CartVO)request.getAttribute("count");
		String memId = (String)session.getAttribute("id");
		MemberVO mVO = (MemberVO)session.getAttribute("loginMember");
		EmployeeVO eVO = (EmployeeVO)session.getAttribute("loginEmpl");
		String name = "";
%>

  				
	<script>
	var kinList = [];
	var clsList = [];
	var eduList = [];
	
	<%
			for(CartVO vo : cartList) {
				
	%>
			var tmp = {};
			<%
				if(!vo.getEdu_no().equals("없음")){
			%>
				tmp['cartNo'] = '<%=vo.getCart_no()%>';
				tmp['eduNo'] = '<%=vo.getEdu_no() %>';
				tmp['eduFee'] = '<%=vo.getEdu_fee() %>';
				tmp['eduTitle'] = '<%=vo.getEdu_title()%>';
				eduList.push(tmp);
			
			<%
			}else {
				if(!vo.getKin_code().equals("없음")) {
			%>
				tmp['cartNo'] = '<%=vo.getCart_no()%>';
				tmp['kinCode'] = '<%=vo.getKin_code() %>';
				tmp['kinFee'] = '<%=vo.getKin_fee() %>';
				tmp['kinGubun'] = '<%=vo.getKin_gubun()%>';
				kinList.push(tmp);
			<%
				}else {
			%>
				tmp['cartNo'] = '<%=vo.getCart_no()%>';
				tmp['clsNo'] = '<%=vo.getCls_no() %>';
				tmp['clsFee'] = '<%=vo.getCls_fee() %>';
				tmp['clsSubject'] = '<%=vo.getCls_subject()%>';
				tmp['clsTitle'] = '<%=vo.getCls_title()%>';
				clsList.push(tmp);
			<%			
				}
			}
			}
			%>

	
// 	오프라인 교육이나 유치원이 장바구니에 있으면 이 버튼 출력
function showButton(){
	kin_count = <%=count.getKin_count()%>;
	edu_count = <%=count.getEdu_count()%>;
	if(kin_count > 0 || edu_count > 0){
		$('#dogButton').show();
	}if(kin_count == 0 && edu_count == 0){
// 		$( '#dogButton' ).attr( 'style', 'display:none' );
		$('#dogButton').hide();
	}
}

 $(function() {
	 //테이블에 장바구니 상품 개수만큼 td추가
	for(i=0; i < kinList.length; i++){
		code = "";
		code += "<tr><td><input type='checkbox' value='가격' class='chk' checked></td>"
		code += "<td>유치원</td>";
		code += "<td>" + kinList[i].kinGubun + "</td>";
		code += "<td class='fee'>" + kinList[i].kinFee + "</td></tr>";
		$('tbody').append(code);
	}
	
	for(i=0; i < clsList.length; i++){
		code = "";
		code += "<tr><td><input type='checkbox' value='가격' class='chk' checked></td>"
		code += "<td>온라인 강좌</td>";
		code += "<td class='subject'><a>" + clsList[i].clsSubject + "</a></td>";
		code += "<td class='fee' name='fee'>" + clsList[i].clsFee + "</td></tr>" ;
		$('tbody').append(code);
	}
	
	for(i=0; i < eduList.length; i++){
		code = "";
		code += "<tr><td><input type='checkbox' value='가격' class='chk' checked></td>"
		code += "<td>개인 교육</td>";
		code += "<td>" + eduList[i].eduTitle + "</td>";
		code += "<td class='fee'>" + eduList[i].eduFee + "</td></tr>" ;
		$('tbody').append(code);
	}

	//장바구니 내 전체 금액 구하기---------------------------------------------------------
	fee = 0;
	for(i = 0; i < $('tbody tr').length; i++) {
 		fee += $('tbody').find('tr').eq(i).find('td').eq(2).text() * 1;
	}
	
	//첫화면에서 총 금액----------------------------------------------------------------
	$('.total').text(fee + '원');
	
	//전체선택 버튼 이벤트---------------------------------------------------------------
	$('.selAll').on('click', function() {
		if(!$('.selAll').is(':checked')) {		//전체 선택 버튼 해제 시
			$('.chk').prop('checked', false);
			fee1 = 0;
			$('.total').text(fee1 + '원');
			
		}else {									//전체 선택 버튼 체크 시
			$('.chk').prop('checked', true);
			$('.total').text(fee + '원');
		}		
	})
	
	//체크박스가 변경되면-----------------------------------------------------------------
	$('.chk').on('change', function() {
		$('.selAll').prop('checked', false);
	 	val = $(this).is(':checked');
		if(val) {
			pay = $(this).parent().parent().find('td').eq(2).text().slice(0,-1) * 1;
		 	total = parseInt($('.total').text().slice(0,-1)) + pay;
		 	$('.total').empty();
		 	$('.total').text(total + '원');
		}else {
		 	pay = $(this).parent().parent().find('td').eq(2).text().slice(0,-1) * 1;
		 	total = parseInt($('.total').text().slice(0,-1)) - pay;
		 	$('.total').empty();
		 	$('.total').text(total + '원');
		}
 	})
 
 })
 

 $(document).ready(function(){ 
	$("#iamportPayment").click(function(){ 
    	payment(); //버튼 클릭하면 호출 
    }); 
 })

	//가맹점 주문번호 랜덤발생
	rnd = Math.random();
//버튼 클릭하면 실행
function payment(data) {
    IMP.init('imp96186914');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
    IMP.request_pay({// param
        pg: "KG이니시스", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
        pay_method: "card", //지불 방법
        merchant_uid: rnd, //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: '민정', //결제창에 노출될 상품명
        amount: $('.total').text(), //금액
        buyer_email : "testiamport@naver.com", 
        buyer_name : "홍길동",
        buyer_tel : "01012341234"
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid);
        } else {
            alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
        }
    });
}


//강아지 정보 입력하는 버튼 누르면 생기는 창
function dogInfo(){
	
	window.open("<%=request.getContextPath()%>/Cart_dogInfo.do", "강아지", "width=1028 height=1000");
// 	a.moveTo(500,500);

}
	</script>
	
	
	
<div id="cartBody">

<%
		if(mVO != null){name = mVO.getMem_name();}else if(eVO != null){name = eVO.getEmp_name();}
%>

<%--   		<h2><%=memId %>님의 장바구니</h2><br><br> --%>
			<h2><%=name%>님의 장바구니</h2><br><br>
	<%
		if(cartList == null || cartList.size() == 0) {		//장바구니 리스트가 없다면
			
	%>
			 <div class="cart">
	  		 <p>장바구니에 상품이 존재하지 않습니다.</p>
			</div>
	<%   	
		}else {		//장바구니에 리스트가 있다면
	%>
  			<div class="cart">


			<table border=1 class="tab1">
			<thead>
				<tr>
				 <th><input type="checkbox" value="selAll" class="selAll" checked></th>
				 <th>상품 구분</th>
				 <th>제품</th>
				 <th>가격</th>
				</tr>
			</thead>
			<tbody class="product">
			</tbody>
			</table>
			<br><br>
			<p>온라인 강좌는 선택 시, 상세 조회가 가능합니다.</p>
  </div>
  
  <div class="sum">
  	<div id="sumDiv">
 	 	<h2>주문 요약</h2><br><hr>
 	 	<p>총 결제 금액</p>
 	 	<p class="total"></p><br>
  	</div>
  	<input type="button" value="강아지 정보 입력" id="dogButton" onclick="dogInfo()">
  	<input type="button" value="결제하기" id="iamportPayment" class = "button">
  	<a href="<%=request.getContextPath()%>/pitAPetStart.do"><input type="button" class="button" value="돌아가기"></a>
  </div>
	<%		
		}
	%>
</div>
<%-- <jsp:include page="../../include/footer.jsp"></jsp:include> --%>
