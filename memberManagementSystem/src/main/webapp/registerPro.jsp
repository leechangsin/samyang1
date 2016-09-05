<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDao"%>
<%@ page import="java.sql.Timestamp"%>

<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="css/style.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="member" class="member.Member">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>

<%
	member.setReg_date(new Timestamp(System.currentTimeMillis()));

	MemberDao memberDao = new MemberDao();
	memberDao.insertMember(member);
%>