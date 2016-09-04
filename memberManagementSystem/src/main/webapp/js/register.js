/**
 * 
 */

$(document).ready(function() {
	// ID중복확인 버튼을 클릭하면 실행
	$("#checkId").click(function() {
		// ID를 입력하고 중복확인 버튼을 클릭한 경우
		if ($("#id").val()) {
			var query = {
				id : $("#id").val()
			};

			$.ajax({
				type : "post",
				url : "confirmId.jsp",
				data : query,
				success : function(data) {
					if (data == 1) { // 사용할 수 없는 아이디일 경우
						alter("사용할 수 없는 아이디입니다.");
						$("#id").val("");
					} else if (data == -1) {// 사용할 수 있는 아이디일 경우
						alert("사용할 수 있는 아이디 입니다.");
					}// end if(data==1)
				}// end success:function(data)
			});// end $.ajax
		} else {// 아이디를 입력하지 않고 ID중복확인 버튼을 클릭한 경우
			alert("사용할 아이디를 입력하세요.");
			$("#id").focus();
		}// end if($("#id").val())
	});// end $("#checkId").click(function()
	

		// 가입하기 버튼을 클릭하면 실행
	$("#process").click(function() {
		// 입력폼에 입력한 상황 체크
		var status = checkIt();

		if (status) {
			var query = {
				id : $("#id").val(),
				passwd : $("#passwd").val(),
				name : $("#name").val(),
				address : $("#address").val(),
				tel : $("#tel").val()
			};

			$.ajax({
				type : "post",
				url : "registerPro.jsp",
				data : query,
				success : function(data) {
					window.locaition.href("main.jsp");
				}
			})// end $.ajax
		}// end if(status)
	})// end $("#process").click(function()

	// 취소 버튼을 클릭하면 실행
	$("#cancle").click(function() {
		window.local.href("main.jsp");
	})
	

	// 사용자가 입력폼에 입력한 상황을 체크
	function checkIt() {
		if (!$("#id").val()) {
			alter("아이디를 입력하세요.");
			$("#id").focus();
			return false;// 사용자가 서비스를 요청한 시점으로 돌아감
		}// end if
		if (!$("#passwd").val()) {
			alter("비밀번호를 입력하세요");
			$("#passwd").focus();
			return false;
		}// end if
		if ($("#passwd").val() != $("#rePasswd").val()) {
			alert("비밀번호를 동일하게 입력하세요.");
			$("#repasswd").focus();
			return false;
		}// end if
		if (!$("#name").val()) {
			alter("사용자 이름을 입력하세요.");
			$("#name").focus();
			return false;
		}// end if
		if (!$("#address").val()) {
			alert("주소를 입력하세요.");
			$("#address").focus();
			status = false;
			return false;
		}
		if (!$("#tel").val()) {
			alter("전화번호를 입력하세요.");
			$("#tel").focus();
			return false;
		}
	}// end checkIt()
});