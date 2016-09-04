/**
 * 
 */

$(document).ready(function() {
	//회원가입 버튼을 클릭하면 실행
	$("#register").click(function() {
		$("#main_auth").load("registerForm.jsp");
	});
});