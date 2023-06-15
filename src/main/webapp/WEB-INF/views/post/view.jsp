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
                <h1>POST VIEW!!!</h1>
            </header>

            <hr />

            <header>
                <h2>${post.title}</h2>
                <span class="byline">${post.writer.name} | ${post.created}</span>
            </header>
            <hr />
            <p>${post.content}asdasdasdaㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㅇㄹㄴㅇㄹㄴㅇㄹㅇㄴㄹㄴ</p>

        </section>

        <!-- Comments -->
        <section class="comment">
            <h3>COMMENTS</h3>
            <div class="table-wrapper">
                <table>
                    <tbody>
                    <c:if test="${post.comments != null}">
                        <c:forEach var="comment" items="${post.comments}">
                            <tr>
                                <td>${comment.id}</td>
                                <td>${comment.content}</td>
                                <td>${comment.created}</td>
                                <td>${comment.writer.name}</td>
                            </tr>
                            <c:if test="${comment.replyComments != null}">
                                <c:forEach var="reply" items="${comment.replyComments}">
                                    <tr>
                                        <td>${reply.id}</td>
                                        <td><span style="margin-left: 40px;"><span>${reply.content}</td>
                                        <td>${reply.created}</td>
                                        <td>${reply.writer.name}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="3"><textarea id="commentTextarea"></textarea></td>
                        <td><button id="submitCommnet" class="large">댓글</button></td>
                    </tr>
                    </tfoot>
                </table>
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
        $('#submitCommnet').click(function () {
            var comment = $('#commentTextarea').val();
            var data = {
                content: comment,
                postId: ${post.id},
                memberId: ${memberId}
            };
            $.ajax({
                type: 'POST',
                url: '/api/comments',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function () {
                alert('댓글이 등록되었습니다.');
                window.location.reload();
            }).fail(function (error) {
                alert(JSON.stringify(error));
            });
        });
    });
</script>

</body>
</html>
