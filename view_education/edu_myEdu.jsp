<%@page import="kr.or.ddit.pitapet.vo.EducationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<EducationVO> myEduList = (List<EducationVO>)request.getAttribute("myEduList");
System.out.println("edu_myEdu.jsp의 서블릿에서 받은 리스트 : " + myEduList);
%>

[

<% 
if(myEduList != null && myEduList.size() > 0){
	
for(int i = 0 ; i < myEduList.size(); i++){
	EducationVO vo = myEduList.get(i);
	
	if(i>0)out.print(",");
%>

{	
	"edu_no" : "<%=vo.getEdu_no() %>",
	"emp_name" : "<%=vo.getEmp_name() %>",
	"edu_title" : "<%=vo.getEdu_title() %>",
	"edu_content" : "<%=vo.getEdu_content() %>",
	"edu_date" : "<%=vo.getEdu_date() %>",
	"edu_place" : "<%=vo.getEdu_place() %>",
	"edu_time" : "<%=vo.getEdu_time() %>",
	"edu_price" : "<%=vo.getEdu_price() %>",
	"edu_limit" : "<%=vo.getEdu_limit() %>",
	"edu_status" : "<%=vo.getEdu_status() %>"
}

	<%
	}
}else {
%>
{
	"edu_title" : "자료 없음"
}
<%	
}
	%>

]
