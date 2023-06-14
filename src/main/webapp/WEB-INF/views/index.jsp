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
        <a href="index.html" class="logo"><c:url value=".."/></a>
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
        <h2>Table</h2>

        <h3>Default</h3>
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
                    <c:forEach var="post" items="${postList}" >
                        <tr>
                            <td>${post.id}</td>
                            <td>${post.title}</td>
                            <td>${post.memberId}</td>
                            <td>${post.created}</td>
                            <td>like:${post.likeCount} | 댓글:0</td>
                            <td>
                                <button class="small">수정</button>
                                <button class="small">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>1</td>
                        <td>Ante turpis integer aliquet porttitor.</td>
                        <td>김상헌</td>
                        <td>2023.05.13</td>
                        <td>like:10 | 댓글:67</td>
                        <td>
                            <button class="small">수정</button>
                            <button class="small">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>A이상이상이상한나라의엘레스or.</td>
                        <td>이상</td>
                        <td>2023.05.13</td>
                        <td>like:0 | 댓글:1</td>
                        <td></td>
                    </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="2"></td>
                    <td>100.00</td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <footer id="footer">
        <section>
            <form method="post" action="#">
                <div class="fields">
                    <div class="field">
                        <label for="name">Name</label>
                        <input type="text" name="name" id="name" />
                    </div>
                    <div class="field">
                        <label for="email">Email</label>
                        <input type="text" name="email" id="email" />
                    </div>
                    <div class="field">
                        <label for="message">Message</label>
                        <textarea name="message" id="message" rows="3"></textarea>
                    </div>
                </div>
                <ul class="actions">
                    <li><input type="submit" value="Send Message" /></li>
                </ul>
            </form>
        </section>
        <section class="split contact">
            <section class="alt">
                <h3>Address</h3>
                <p>1234 Somewhere Road #87257<br />
                    Nashville, TN 00000-0000</p>
            </section>
            <section>
                <h3>Phone</h3>
                <p><a href="#">(000) 000-0000</a></p>
            </section>
            <section>
                <h3>Email</h3>
                <p><a href="#">info@untitled.tld</a></p>
            </section>
            <section>
                <h3>Social</h3>
                <ul class="icons alt">
                    <li><a href="#" class="icon brands alt fa-twitter"><span class="label">Twitter</span></a></li>
                    <li><a href="#" class="icon brands alt fa-facebook-f"><span class="label">Facebook</span></a></li>
                    <li><a href="#" class="icon brands alt fa-instagram"><span class="label">Instagram</span></a></li>
                    <li><a href="#" class="icon brands alt fa-github"><span class="label">GitHub</span></a></li>
                </ul>
            </section>
        </section>
    </footer>

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

</body>
</html>
