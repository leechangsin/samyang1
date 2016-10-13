<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="member.MemberDao"%>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="member" class="member.Member"/>
	<jsp:setProperty name="member" property="*"/>

<%
	MemberDao memberDao = new MemberDao();
	int check = memberDao.updateMember(member);
	
	out.println(check);
%>