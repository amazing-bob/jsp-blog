<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>게시판 목록</title>
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
        <ul class="links">
            <li><a href="/login">Login</a></li>
            <li><a href="/members/register">SignUp</a></li>
            <li><a href="#">Logout</a></li>
            <li><a href="/members/5">김상헌</a></li>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">

        <!-- Post -->
        <section class="post">
            <header class="major">
                <h1>POSTS LIST!!!</h1>
            </header>
            <h2>
                <button id="writeBtn" class="primary large">글쓰기</button>
            </h2>
            <div class="table-wrapper">
                <table>
                    <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>좋아요/댓글</th>
                        <th>삭제/수정</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="post" items="${posts}" >
                            <tr>
                                <td>${post.id}</td>
                                <td><a href="/posts/${post.id}">${post.title}</a></td>
                                <td>${post.writer.name}</td>
                                <td>${post.created}</td>
                                <td>like:${post.likeCount} | 댓글: ${post.commentCount}</td>
                                <td>
                                    <button class="small primary">수정</button>
                                    <button class="small">삭제</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="7">
                            <div class="pagination">
                                <a href="#" class="previous">Prev</a>
                                <a href="#" class="page active">1</a>
                                <a href="#" class="page">2</a>
                                <a href="#" class="page">3</a>
                                <span class="extra">&hellip;</span>
                                <a href="#" class="page">8</a>
                                <a href="#" class="page">9</a>
                                <a href="#" class="page">10</a>
                                <a href="#" class="next">Next</a>
                            </div>
                        </td>
                    </tr>
                    </tfoot>
                </table>
                <!-- Footer -->
                <footer>

                </footer>
            </div>
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
        $("#writeBtn").click(function () {

            let isValid = true;
            if (!isValid) { //TODO: 로그인 벨리데이션 로직 필요
                alert("로그인이 필요합니다.");
                return;
            }
            location.href = "/posts/write";
        });
    });
</script>

</body>
</html>
