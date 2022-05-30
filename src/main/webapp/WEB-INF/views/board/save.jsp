<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-27
  Time: 오후 5:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/resources/js/jquery.js"></script>
<title>Title</title>
</head>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<form action="/board/save" method="post" enctype="multipart/form-data">

    <input type="text" name="boardWriter" value="${sessionScope.getMemberId}" readonly><br>
    <br>
    <input type="text" name="boardTitle" placeholder="제목"><br>
    <br>
    <textarea name="boardContents" type="text" placeholder="내용"></textarea>
    <br>
    <input type="file" name="boardProfile" placeholder="첨부파일"><br>
    <br>
    <input type="submit" value="글작성">
</form>

</div>
</body>
</html>
