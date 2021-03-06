<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-28
  Time: 오후 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="container mt-3">
    <form action="/board/search" method="get">
        <select name="searchType">
            <option value="boardTitle">제목</option>
            <option value="boardWriter">작성자</option>
        </select>
        <input type="text" name="q" placeholder="검색어입력">
        <input type="submit" class="btn btn-dark" value="검색">
    </form>
</div>
<div class="container">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>작성시간</th>
            <th>조회수</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td>${board.boardWriter}</td>
                <td><a  class="link-dark" href="/board/detail?page=${paging.page}&id=${board.id}">${board.boardTitle}</a></td>
                <!--BoardController 모델값으로 paging과 board 가져옴-->
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                    value="${board.boardCreatedDate}"></fmt:formatDate></td>
                <!--<fnt taglib을 적용해서 시간을 표현해주는 formatDate을 사용  -->
                <td>${board.boardHits}</td>
                    <%--                <th>조회수</th>--%>

            </tr>
        </c:forEach>
    </table>
</div>

<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link" style="color: gray">[이전]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item link-dark">
                    <a class="page-link link-dark" href="/board/paging?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active link-dark">
                        <a class="page-link link-dark" style="border-color: black; background-color:gray" >${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item link-dark">
                        <a class="page-link link-dark" href="/board/paging?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link" style="color: gray">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item link-dark">
                    <a class="page-link link-dark" href="/board/paging?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
</body>
</html>
