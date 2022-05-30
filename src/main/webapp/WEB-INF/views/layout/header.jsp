<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-23
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/css/headers.css"></script>

</head>
<body>

<header class="form-control" ><!--header 구분용 역할은 x 시맨틱 태그-->
   회원번호:${[sessionScope.getId]}&nbsp ID:${[sessionScope.getMemberId]}&nbsp
    <div class="rightContainer" >
    <input type="button" value="회원가입" onclick="MSave(${sessionScope.getId})"></input>&nbsp
    <input type="button" value="로그인" onclick="MLogin(${sessionScope.getId})" ></input>&nbsp
    <input type="button" value="글쓰기" onclick="BSave(${sessionScope.getId})"></input>&nbsp
    <input type="button" value="글목록" onclick="BPaging(${sessionScope.getId})"></input>&nbsp
    <input type="button" value="로그아웃" onclick="MLogout(${sessionScope.getId})"></input>
    </div>

</header>

</body>
<script>
    function MSave(Check1){
        if (Check1==null){
            location.href="/member/save";
        }else{
            alert("이미 로그인 중입니다 로그아웃 후에 다시 이용해주세요")
        }
    }
    function MLogin(Check2){
        if(Check2!=null){
            alert("이미 로그인중입니다")
        }else {
            location.href="/member/login";
        }
    }

    function BSave(Check3){
        if(Check3==null){
            alert("로그인후 이용해주세요")
            location.href="/member/login"
        }else {
            location.href="/board/save"
        }
    }
    function BPaging(Check4) {
        if (Check4 == null) {
            alert("로그인후 이용해주세요")
            location.href = "/member/login"
        } else {
            location.href = "/board/paging"
        }

    }
    function MLogout(Check5){
        if(Check5==null){
            alert("이미 로그아웃 상태입니다")
        }else {
            location.href="/member/logout"
        }

    }

</script>
</html>