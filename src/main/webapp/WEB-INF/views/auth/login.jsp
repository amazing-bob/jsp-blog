6<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 게시판 목록 html -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <%--    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/>" />--%>
    <link rel="stylesheet" href="/assets/css/main.css" />
    <noscript><link rel="stylesheet" href="/assets/css/noscript.css" /></noscript>
    <title>로그인</title>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <a href="index.html" class="logo">Edgar's Blog</a>
    </header>

    <!-- Main -->
    <div id="main">

        <!-- Write -->
        <section class="post">
            <header class="major">
                <h1>로그인</h1>
            </header>

            <hr />

            <!-- Form -->
            <form method="post" action="#">
                <div class="row gtr-uniform">

                    <div class="col-3 col-12-small"></div>
                    <div class="col-6 col-12-xsmall">
                        <input type="email" name="emailTextInput" id="emailTextInput" value="" placeholder="Email" />
                    </div>
                    <div class="col-3 col-12-small"></div>

                    <div class="col-3 col-12-small"></div>
                    <div class="col-6 col-12-xsmall">
                        <input type="password" name="passwordTextInput" id="passwordTextInput" value="" placeholder="Password" />
                    </div>
                    <div class="col-3 col-12-small"></div>

                    <div class="col-12 col-12-small"></div>

                    <!-- Break -->
                    <div class="col-3"></div>
                    <div class="col-6 col-12-large">
                        <ul class="actions">
                            <li><input type="reset" value="취소" /></li>
                            <li><input type="button" name="loginBtn" id="loginBtn" value="로그인" class="primary" /></li>
                        </ul>
                    </div>
                    <div class="col-3"></div>
                </div>
            </form>

        </section>


    </div> <!-- end of main -->




    <!-- Copyright -->
    <div id="copyright">
        <ul><li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
    </div>

</div>

<!-- Scripts -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/jquery.scrollex.min.js"></script>
<script src="/assets/js/jquery.scrolly.min.js"></script>
<script src="/assets/js/browser.min.js"></script>
<script src="/assets/js/breakpoints.min.js"></script>
<script src="/assets/js/util.js"></script>
<script src="/assets/js/main.js"></script>

<script>
    $(document).ready(function () {
        $("#loginBtn").click(function () {
            var email = $("#emailTextInput").val();
            var password = $("#passwordTextInput").val();

            if(email == "") {
                alert("이메일을 입력해주세요.");
                $("#emailTextInput").focus();
                return false;
            }

            if(password == ""){
                alert("비밀번호를 입력해주세요.");
                $("#passwordTextInput").focus();
                return false;
            }

            var param = {
                "name" : name,
                "email" : email
            };


            $.ajax({
                url: "/auth/login",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(param),
                success: function (data) {
                    console.log(data);
                    // data null check
                    if(data.id > 0){
                        alert("성공");
                        location.href = "/posts";
                    }else{
                        alert("실패");
                    }
                },
                error: function (e) {
                    alert("실패");
                }
            });
        });
    });
</script>

</body>
</html>
