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
    <div class="position-absolute top-50 start-50 translate-middle d-grid mx-auto">
    <input type="text" style="background-color:#e9ecef" class="form-control mb-3" name="id" value="${findById.id}"hidden>
    <input type="text" style="background-color:#e9ecef" class="form-control mb-3" name="boardWriter" value="${sessionScope.getMemberId}" readonly>
    <input type="text" style="background-color:#e9ecef" class="form-control mb-3" name="boardTitle" placeholder="제목">
    <textarea  name="boardContents" style="background-color:#e9ecef" class="form-control mb-3" type="text" placeholder="내용"></textarea>
    <input type="file" class="form-control mb-3" name="boardProfile" placeholder="첨부파일">
    <input type="submit" class="btn btn-dark" value="글작성">
    </div>
</form>

</div>
</body>
</html>
