<%@page import="kr.or.ddit.pitapet.vo.DogVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
DogVO dogOne = (DogVO)request.getAttribute("dogOne");
System.out.println("cart_dogInfo.jsp의 서블릿에서 받은 개정보 : " + dogOne);
%>



<% 
if(dogOne != null){
	
%>

{	
	"dogNo" : "<%=dogOne.getDog_no()%>",
	"dogName" : "<%=dogOne.getDog_name()%>",
	"dogType" : "<%=dogOne.getDog_type() %>",
	"dogGender" : "<%=dogOne.getDog_gender()%>",
	"dogBir" : "<%=dogOne.getDog_bir()%>",
	"dogSur" : "<%=dogOne.getDog_sur()%>",
	"dogVa" : "<%=dogOne.getDog_va()%>",
	"dogAl" : "<%=dogOne.getDog_al()%>",
	"dogEtc" : "<%if(dogOne.getDog_etc() == null){%>없음<%}else{%>dogOne.getDog_etc()<%}%>"
}
<%
}else {
%>
{
	"dogNo" : "정보 없음"
}
<%	
}
	%>

