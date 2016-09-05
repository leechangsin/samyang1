<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDao"%>

<% request.setCharacterEncoding("utf-8");%>

<%
	String id = request.getParameter("id");

	MemberDao memberDao = new MemberDao();
	
	int check = memberDao.confirmId(id);
	out.println(check);
%>