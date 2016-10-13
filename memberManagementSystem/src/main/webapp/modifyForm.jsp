<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="member.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="css/style.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/modify.js"></script>

<%request.setCharacterEncoding("utf-8");%>

<%
	String id =(String)session.getAttribute("id");
	String passwd = request.getParameter("passwd");
	
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.getMember(id, passwd);
	
	try{//얻어낸 사용자 정보를 화면에 표시
%>
	<div id ="regForm" class="box">
		<ul>
			<li><p class="center">회원 정보 수정
			<li><label for="id">아이디</label>
				<input type="email" id="id" name="id" size="20" maxlength="50" value="<%=id%> readonly disabled">
			<li><label for="passwd">비밀번호</label>
				<input type="password" id="passwd" name="passwd" size="20" maxlength="16" placeholder="6~16자 문자/숫자">
			<li><label for="name">이름</label>
				<input type="text" id="name" name="name" size="20" maxlength="10" value="<%=member.getName()%>">
			<li><label for="address">주소</label>
				<input type="text" id="address" name="address" size="30" maxlength="50" value="<%=member.getAddress()%>">
			<li><label for="tel">전화번호</label>
				<input type="text" id="tel" name="tel" size="20" maxlength="20" value="<%=member.getTel()%>">
			<li class="label2">
				<button id="modifyProcess">수정</button>
				<button id="cancle">취소</button>
		</ul>
	</div>
<%
	}catch(Exception e){
		e.printStackTrace();
	}//end try
%>