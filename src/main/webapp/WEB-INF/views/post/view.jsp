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
    <title>포스팅 보기</title>
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
                <span class="byline">
                    ${post.writer.name} |
                    ${cfn:formatLocalDateTime(post.created, "MM.dd")}
                </span>
                <button type="button" name="modifyBtn" id="modifyBtn" class="small">수정</button>
                <button type="button" name="deletePostBtn" id="deletePostBtn" class="primary small">삭제</button>
            </header>
            <hr />
            <p style="white-space: pre-wrap">${post.content}</p>

        </section>

        <!-- Comments -->
        <section class="comment">
            <h3>COMMENTS</h3>
            <div class="table-wrapper">
                <table>
                    <tbody id="commentTbody">
                    <c:if test="${post.comments != null}">
                        <c:forEach var="comment" items="${post.comments}">
                            <tr>
                                <input type="hidden" name="commentId" value="${comment.id}"/>
                                <input type="hidden" name="parentId" value="${comment.parentId}"/>
                                <td>
                                    <span>[${comment.id}] </span>
                                    <span style="white-space: pre-wrap">${comment.content}</span>
                                </td>
                                <td>${cfn:formatLocalDateTime(comment.created, "MM.dd")}</td>
                                <td>
                                    <span>${comment.writer.name}</span>
                                    <button name="toggleReplyBtn" class="small">댓글</button>
                                    <button name="deleteCommentBtn" class="small">삭제</button>
                                </td>
                            </tr>
                            <tr class="reply-toggle" hidden="hidden">
                                <input type="hidden" name="parentId" value="${comment.parentId}">
                                <td colspan="2">
                                    <textarea name="replyTextarea"></textarea>
                                </td>
                                <td><button name="submitReplyBtn" class="primary large">댓글</button></td>
                            </tr>
                            <c:if test="${comment.replyComments != null}">
                                <c:forEach var="reply" items="${comment.replyComments}">
                                    <tr>
                                        <input type="hidden" name="commentId" value="${reply.id}"/>
                                        <input type="hidden" name="parentId" value="${reply.parentId}"/>
                                        <td>
                                            <span>[${reply.id}] </span>
                                            <span style="margin-left: 40px;"></span>
                                            <span style="white-space: pre-wrap">${reply.content}</span>
                                        </td>
                                        <td>${cfn.formatLocalDateTime(reply.created, "MM.dd")}</td>
                                        <td>
                                            <span>${reply.writer.name}</span>
                                            <button name="deleteCommentBtn" class="small">삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td><textarea name="commentTextarea" id="commentTextarea"></textarea></td>
                        <td><button name="submitCommnetBtn" id="submitCommnetBtn" class="large">댓글</button></td>
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
        /**
         * 게시글 수정
         */
        $('#modifyBtn').click(function() {
            //TODO 로그인 체크 벨리데이션
            location.href = '/posts/${post.id}/modify';
        });

        /**
         * 댓글 등록
         */
        $('#submitCommnetBtn').click(function () {
            var content = $('#commentTextarea').val();
            if (content == '') {
                alert('내용을 입력해주세요.');
                return false;
            };
            if (content == '') {
                alert('내용을 입력해주세요.');
                return false;
            }
            var data = {
                postId: ${post.id},
                memberId: 1, //FIXME: 세션에서 가져오기
                content: content
            };
            $.ajax({
                type: 'POST',
                url: '/posts/${post.id}/comments',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(data)
            }).done(function (data) {
                alert('댓글이 등록되었습니다.');
                location.reload();
            }).fail(function (error) {
                alert(JSON.stringify(error));
            });
        });

        /**
         * 대댓글 Textarea show
         */
        $('button[name="toggleReplyBtn"]').click(function () {
            if ($(this).text() == '취소') {
                $(this).parent().parent().next('.reply-toggle').hide();
                $(this).text('댓글');
                $(this).removeClass('reply-show');
            }else {
                $(this).parent().parent().next('.reply-toggle').show();
                $(this).parent().parent().next('.reply-toggle').children().children('textarea').val("");
                $(this).text('취소');
                $(this).addClass('reply-show');
            }
        });

        /**
         * 대댓글 등록
         */
        $('button[name="submitReplyBtn"]').click(function () {
            var content = $(this).parent().parent().find('textarea[name="replyTextarea"]').val();
            var parentId = $(this).parent().parent().find('input[name="parentId"]').val();
            if (content == '') {
                alert('내용을 입력해주세요.');
                return false;
            }
            var data = {
                postId: ${post.id},
                parentId: parentId,
                memberId: 1, //FIXME: 세션에서 가져오기
                content: content
            };
            $.ajax({
                type: 'POST',
                url: '/posts/${post.id}/comments',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(data)
            }).done(function (data) {
                alert('댓글이 등록되었습니다.');
                //등록한 댓글 추가
                location.reload();
            }).fail(function (error) {
                alert(JSON.stringify(error));
            });
        });

        /**
         * 댓글 대댓글 삭제
         */
        $('button[name=deleteCommentBtn]').click(function() {
            if(!confirm("정말 댓글을 삭제하시겠습니까?"))
                return false;
            var commentId = $(this).parent().parent().find('input[name="commentId"]').val();
            var parentId = $(this).parent().parent().find('input[name="parentId"]').val();
            var data = {
                id: commentId,
                postId: ${post.id},
                parentId: parentId
            };
            console.log(data);
            $.ajax({
                type: 'DELETE',
                url: '/posts/${post.id}/comments/'+commentId,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(data)
            }).done(function (data) {
                alert('삭제 완료');
                location.reload();
            }).fail(function (error) {
                alert(JSON.stringify(error));
            });

        });

        /**
         * 게시글 삭제
         */
        $('#deletePostBtn').click(function(){
            if(!confirm("정말 포스팅을 삭제하시겠습니까?"))
                return false;
            var data = {};
            $.ajax({
                type: 'DELETE',
                url: '/posts/${post.id}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(data)
            }).done(function (data) {
                alert('삭제 완료');
                location.href = '/posts';
            }).fail(function (error) {
                alert(JSON.stringify(error));
            });
        });

    });
</script>

</body>
</html>
