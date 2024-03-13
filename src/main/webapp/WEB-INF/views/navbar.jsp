<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navbar with Modal</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">Ferr</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="/schedulelist"
						class="btn btn-primary">일정 관리</a></li>
					<li class="nav-item">
						<!-- <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#loginModal">시작</button> -->
						<button type="button" class="btn btn-secondary"
							data-toggle="modal" data-target="#loginModal" id="startButton">시작</button>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel">로그인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="loginForm" action="/login" method="post">
						<div class="form-group">
							<label for="email">이메일:</label> <input type="email"
								class="form-control" id="email" name="email" required>
						</div>
						<div class="form-group">
							<label for="password">비밀번호:</label> <input type="password"
								class="form-control" id="password" name="password" required>
						</div>
						<button type="submit" class="btn btn-primary btn-block">로그인</button>
					</form>
					<hr>
					<h5 class="text-center">또는</h5>
					<button class="btn btn-warning btn-block" id="kakao-login-btn">
						<i class="fab fa-kakao"></i> 카카오 로그인
					</button>
					<div class="text-center">
						<a href="/signup" class="btn btn-link">회원가입</a> <a
							href="/signup-social" class="btn btn-link">카카오로 시작하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
    Kakao.init('YOUR_KAKAO_JAVASCRIPT_KEY');
    $('#kakao-login-btn').click(function() {
        Kakao.Auth.login({
            success: function(authObj) {
                console.log(authObj);
            },
            fail: function(err) {
                alert(JSON.stringify(err));
            }
        });
    });

    $(document).ready(function() {
    	console.log(${sessionScope.user});
      $('#loginForm').submit(function(e) {
            //e.preventDefault();
            // 로그인 처리 로직
        });
        
        
        //1.세션 가져오기
        //2. 세션 -> 있다-> 시작버튼 id -> style display none
        //$('#startButton')
        //userDTO - DB field match
        
        
   });
    
    /* $(document).ready(function() {
        // 세션 확인 및 시작 버튼 제어
        $.ajax({
            type: "GET",
            url: "/checkSession", // 세션을 확인하는 서버의 엔드포인트
            success: function(response) {
                if (response.sessionExists) {
                    $('#loginModal').on('shown.bs.modal', function () {
                        $('#startButton').hide(); // 세션이 있는 경우 시작 버튼 숨기기
                    });
                }
            }
        }); */
</script>

	<!-- 부트스트랩 4와 Popper.js -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>