<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서블릿에서 공유 데이터 가져오기
	int resultNum = (Integer)request.getAttribute("resultNum");
	if(resultNum > 0){
%>
		{
			"sw" : "장바구니에 담겼습니다."
		}
<%
	}else{
%>
		{
			"sw" : "장바구니에 담기지 않았습니다.\n피터펫에 문의해주세요."
		}
<%		
	}
%>
