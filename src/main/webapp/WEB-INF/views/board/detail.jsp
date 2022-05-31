<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-29
  Time: 오후 6:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>


<div class="container">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>작성시간</th>
            <th>조회수</th>

            <c:if test="${UserDb.boardProfileName ne null}">
            <th>사진</th>
            </c:if>

            <c:if test="${sessionScope.getMemberId eq UserDb.boardWriter || sessionScope.getMemberId eq 'admin'}">
            <th>수정</th>
            <th>삭제</th>
            </c:if>
        </tr>

            <tr>
                <td>${UserDb.id}</td>
                <td>${UserDb.boardWriter}</td>
                <td>${UserDb.boardTitle}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                    value="${UserDb.boardCreatedDate}"></fmt:formatDate></td>
                <td>${UserDb.boardHits}</td>

                <c:if test="${UserDb.boardProfileName ne null}">
                <td> <img src="${pageContext.request.contextPath}/upload/${UserDb.boardProfileName}" alt="" height="50">
                    </td>
                </c:if>


                <c:if test="${sessionScope.getMemberId eq UserDb.boardWriter || sessionScope.getMemberId eq 'admin'}">
                <td><input type="button" class="btn btn-dark"  value="수정"  onclick="update()"></td>
                <td><input type="button" class="btn btn-dark" value="삭제" onclick="drop()"></td>
                </c:if>

            </tr>
    </table>
    </div>
<div class="container">
    <div id="comment-write" class="input-group mb-3">
        <input type="text" id="commentWriter" class="form-control" value="${sessionScope.getMemberId}" hidden>
        <input type="text" id="commentContents"  class="form-control" placeholder="내용"><br>
        <button id="comment-write-btn"  class="btn btn-dark" onclick="commentSave()">댓글작성</button>
    </div>
</div>

<div id="comment-list" class="container" >
    <table class="table">
        <tr>
            <th>댓글번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                    value="${comment.commentCreatedDate}"></fmt:formatDate></td>
            </tr>
        </c:forEach>

    </table>
</div>

</body>
<script>
    function update(){
            location.href="/board/updateForm?id=${UserDb.id}";
    }
    function drop(){
        location.href="/board/delete?id=${UserDb.id}";
    }
    function commentSave() {
        if(${sessionScope.getMemberId==null}){
            alert("로그인후 이용해주세요")
        }
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = document.getElementById("commentContents").value;
        const boardId='${UserDb.id}';

        $.ajax({
            type:"post",
            url:"/comment/save",
            data:{
                "commentWriter": commentWriter,
                "commentContents" :commentContents,
                "boardId" : boardId
            },
            dataType:"json",
            success:function (returnResult){
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";

                for (let i in returnResult){
                    output += "<tr>";
                    output += "<td>" + returnResult[i].id + "</td>";
                    output += "<td>" + returnResult[i].commentWriter + "</td>";
                    output += "<td>" + returnResult[i].commentContents + "</td>";
                    output += "<td>" + moment(returnResult[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                    output += "</tr>";//moment 순간
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentContents').value = '';//입력받은 내용 입력한값을 공백값으로 바꿔준다
            },
            error: function () {
                console.log("x")
            }
        });

    }

</script>
</html>
