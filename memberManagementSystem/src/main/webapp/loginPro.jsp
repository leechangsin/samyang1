<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="member.MemberDao"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	MemberDao memberDao = new MemberDao();
	int check = memberDao.confirmId(id);
	
	if(check == 1)
		session.setAttribute("id", id);
	
	out.println(check);
%>