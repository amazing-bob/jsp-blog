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
    <title>글쓰기</title>
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

        <!-- Write -->
        <section class="post">
            <header class="major">
                <h1>POSTING!!!</h1>
            </header>

            <hr />

            <!-- Form -->
            <h2>새 글쓰기</h2>

            <form method="post" action="#">
                <div class="row gtr-uniform">
                    <div class="col-12 col-12-xsmall">
                        <input type="hidden" name="postIdHidden" id="postIdHidden" value="${post.id}"/>
                        <input type="text" name="postTitleInputText" id="postTitleInputText" value="${post.title}" placeholder="제목" />
                    </div>

                    <!-- Break -->
                    <div class="col-12">
                        <textarea name="demo-message" id="postConentTextarea" placeholder="포스팅내용 입력" rows="15">${post.content}</textarea>
                    </div>
                    <!-- Break -->
                    <div class="col-12">
                        <ul class="actions">
                            <li><input type="reset" value="초기화" /></li>
                            <li><input type="button" name="postWriteBtn" id="postWriteBtn" value="글쓰기" class="primary" /></li>
                        </ul>
                    </div>
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
        $("#postWriteBtn").click(function () {
            var postId = $("#postIdHidden").val();
            var postTitle = $("#postTitleInputText").val();
            var postContent = $("#postConentTextarea").val();

            if(postTitle == ""){
                alert("제목을 입력해주세요.");
                $("#postTitleInputText").focus();
                return false;
            }

            if(postContent == ""){
                alert("내용을 입력해주세요.");
                $("#postConentTextarea").focus();
                return false;
            }

            var httpMethod = "POST";
            var param = {
                "title" : postTitle,
                "content" : postContent
            };
            if (postId > 0) {
                httpMethod = "PUT";
                param.id = postId;
            }


            $.ajax({
                url: "/posts",
                type: httpMethod,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(param),
                success: function (data) {
                    console.log(data);
                    // data null check
                    if(data.id > 0){
                        alert("성공");
                        location.href = "/posts/"+data.id;
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
