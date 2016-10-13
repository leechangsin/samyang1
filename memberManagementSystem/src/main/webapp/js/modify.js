var status = true;

$(document).ready(function(){
	//정보수정 버튼을 클릭하면 실행
	$("#modify").click(function(){
		var query = {
				passwd : $("#passwd").val()
		};
		
		$.ajax({
			type : "post",
			url : "memberCheck.jsp",
			data : query,
			success : function(data){
				if(data == 1)//비밀번호가 맞음
					$("#main_auth").load("modifyForm.jsp?passw="+$("#passwd").val());
				else{//비밀번호가 틀림
					alert("비밀번호가 맞지 않습니다.");
					$("#passwd").val("");
					$("#passwd").focus();
				}//end if
			}
		});
	});//end $("#modify").click(function()
	
	//수정 버튼을 클릭하면 실행
	$("#modifyProcess").click(function(){
		var query = {
				id : $("#id").val(),
				passwd : $("#passwd").val(),
				name : $("#name").val(),
				address : $("address").val(),
				tel : $("#tel").val()
		};
		
		$.ajax({
			type : "post",
			url : "modifyPro.js",
			data : query,
			success : function(data){
				if(data == 1){
					alert("회원정보가 수정되었습니다.");
					window.location.herf("main.jsp");
				}//end if
			}
		});
	});//end $("#modifyProcess").click(function()
	
	//modifyForm.jsp페이지의 취소버튼 클릭하면 실행
	$("#cancle").click(function(){
		window.location.href("main.jsp");
	});
	
	//탈퇴버튼을 클릭하면 실행
	$("#delete").click(function(){
		var query = {
				passwd : $("#passwd").val()
		};
		
		$.ajax({
			type : "post",
			url : "memberCheck.jsp",
			data : query,
			success : function(data){
				if(data == 1){//비밀번호 맞음
					$.ajax({
						type : "post",
						url : "deletePro.jsp",
						data : query,
						success : function(data){
							if(data == 1){//탈퇴 성공
								alert("회원 탈퇴가 되었습니다.");
								$("main_auth").load("loginForm.jsp");
							}//end if(data == 1)
						}
					});//end $.ajax 
				} else{//비밀번호 틀림
					alert("비밀번호가 맞지 않습니다.");
					$("#passwd").val("");
					$("#passwd").focus();
				}//end if(data == 1)
			}
		});
	});//end $("#delete").click(function()
});