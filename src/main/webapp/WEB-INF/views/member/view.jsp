<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="http://com.example.jspblog.jsptag/tld/functions" %>

<!-- 게시판 목록 html -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <%--    <link rel="stylesheet" href="<c:url value="/assets/css/main.css"/>" />--%>
    <link rel="stylesheet" href="/assets/css/main.css" />
    <noscript><link rel="stylesheet" href="/assets/css/noscript.css" /></noscript>
    <title>회원정보</title>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <a href="index.html" class="logo">Edgar's Blog</a>
    </header>

    <!-- Nav -->
    <nav id="nav">
        <ul class="links">
            <li><a href="index.html">This is Massively</a></li>
            <li><a href="generic.html">Generic Page</a></li>
            <li class="active"><a href="elements.html">Elements Reference</a></li>
        </ul>
        <ul class="icons">
            <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
            <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
            <li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
        </ul>
    </nav>



    <!-- Main -->
    <div id="main">
        <!-- Post -->
        <section class="post">
            <header class="major">
                <h1>회원정보!!!</h1>
            </header>
            <hr />
            <section class="split contact">
                <section class="alt">
                    <h3>Address</h3>
                    <p>${member.name}</p>
                </section>
                <section>
                    <h3>Email</h3>
                    <p>${member.email}</p>
                </section>
            </section>
            <button type="button" name="modifyBtn" id="modifyBtn" class="small">수정</button>
            <button type="button" name="withdrawMemberBtn" id="withdrawMemberBtn" class="primary small">회원탈퇴</button>
            <hr />

        </section>

    </div>




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
        /**
         * 게시글 수정
         */
        $('#modifyBtn').click(function() {
            //TODO 로그인 체크 벨리데이션
            location.href = '/members/${member.id}/modify';
        });


        /**
         * 회원탈퇴
         */
        $('#withdrawMemberBtn').click(function(){
            if(!confirm("정말 회원 탈퇴하시겠습니까?"))
                return false;
            var data = {};
            $.ajax({
                type: 'DELETE',
                url: '/members/${member.id}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(data)
            }).done(function (data) {
                alert('탈퇴 완료');
                location.href = '/posts';
            }).fail(function (error) {
                alert(JSON.stringify(error));
            });
        });

    });
</script>

</body>
</html>
