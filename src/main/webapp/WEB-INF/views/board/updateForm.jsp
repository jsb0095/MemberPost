<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-30
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<form action="/board/update" method="post" enctype="multipart/form-data">
    <input type="text" name="id" value="${findById.id}"hidden>
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
