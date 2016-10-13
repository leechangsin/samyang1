<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="css/style.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/login.js"></script>

<%
String id="";
try{
	id=(String)session.getAttribute("id");
%>
<%
	if(id == null || id.equals("")){
%>
		<div id="status">
			<ul>
				<li><label for="id">아이디</label>
				<input type="email" id="id" name="id" size="20" maxlength="50" placeholder="example@kings.com" required="required">
				<li><label for="passwd">비밀번호</label>
				<input type="password" name="passwd" name="passwd" size="20" maxlength="16" placeholder="6~16자 숫자/문자" required="required">
				<li class="label2">
					<button id="login">로그인</button>
					<button id="register">회원가입</button>
			</ul>
		</div>
<%
	} else{
%>
		<div id="status">
			<ul>
				<li><b><%=id %></b>님이 로그인 하셨습니다.
				<li class="label2"> 
					<button id="logout">로그아웃</button>
					<button id="update">회원 정보 변경</button>
			</ul>
		</div>
<%
	}//end ifif(id == null || id.equals(""))
}catch(Exception e){
	e.printStackTrace();
}//end try
%>