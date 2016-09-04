<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="css/style.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/login.js"></script>

<div id="regForm" class="box">
	<ul>
		<li><label for="id">아이디</label>
			<input type="email" id="id" name="id" size="20" maxlength="50" placeholder="example@kings.com" autofocus required="required">
			<button id ="checkId">ID중복확인</button>
		<li><label for="passwd">비밀번호</label>
			<input type="password" id="passwwd" name="passwd" size="20" maxlength="16" placeholder="6~16자 숫자/문자" required="required">
		<li><label for="repass">비밀번호 재입력</label>
			<input type="password" id="rePasswd" name="rePasswd" size="20" maxlength="16" placeholder="비밀번호 재입력" required="required">
		<li><label for="name">이름</label>
			<input type="text" id="name" name="name" size="20" maxlength="20" placeholder="홍길동">
		<li><label for="address">주소</label>
			<input type="text" id="address" name="address" size="30" maxlength="50" placeholder="주소 입력">
		<li><label for="tel">전화번호</label>
			<input type="tel" id="tel" name="tel" size="20" maxlength="20" placeholder="전화번호 입력">
		<li class="label2">
			<button id="process">가입하기</button>
			<button id="cancle">취소</button>
	</ul>
</div>