$(document).ready(function() {
	//회원가입 버튼을 클릭하면 실행
	$("#register").click(function() {
		$("#main_auth").load("registerForm.jsp");
	});
	
	//로그인 버튼을 클릭하면 실행
	$("#login").click(function(){
		checkIt();
		if(status){
			var query = {
					id :$("#id").val(),
					passwd : $("#passwd").val()
			};
			
			$.ajax({
				type : "post",
				url : "loginPro.jsp",
				data : query,
				succes : function(data){
					if(data == 1)//로그인 성공
						$("#main_auth").load("loginForm.jsp");
					else if(data == 0){//비밀번호 틀림
						alert("비밀번호가 맞지 않습니다.");
						$("#passwd").val("");
						$("#passwd").focuse();
					} else if(data == -1){//아이디 틀림
						alter("아이디가 맞지 않습니다.");
						$("#id").val("");
						$("#passwd").val("");
						$("#id").focus();
					}//end if(data == 1)
				}
			});//end $.ajax({
		}//end if(status){
	});//end $("#login").click(function()
	
	//회원정보 변경 버튼을 클릭하면 실행
	$("#update").click(function(){
		$("#main_auth").load("modify.jsp");
	});//end $("#update").click(function()
	
	//로그아웃 버튼을 클릭하면 실행
	$("#logout").click(function(){
		$.ajax({
			type : "post",
			url : "logout.jsp",
			success : function(data){
				$("#main_auth").load("loginForm.jsp");
			}
		});
	});//end $("#logout").click(function()
});

function checkIt(){
	status = true;
	if(!$.trim($("#id").val())){
		alert("아이디를 입력하세요.");
		$("#id").focus();
		status = false;
		return false;
	}
	if(!$.trim($("#passwd").val())){
		alert("비밀번호를 입력하세요.");
		$("#passwd").focus();
		status = false;
		return false;
	}
}