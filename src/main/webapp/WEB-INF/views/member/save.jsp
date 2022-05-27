<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-26
  Time: 오후 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="/resources/js/jquery.js"></script>
    <title>Title</title>
</head>
<body>
<div class="container">
    <h3>회원가입</h3>
    <form method="post" action="/member/save" enctype="multipart/form-data">
    <input type="text" name="memberId" id="memberId" placeholder="아이디" onblur="duplicateCheck()">
        <h6 id="duplicate"></h6>
    <input type="password" name="memberPassword" placeholder="비밀번호" onblur=""><br>
        <h6></h6>
    <input type="text" name="memberName" placeholder="이름"><br>
        <h6></h6>
    <input type="email" name="memberEmail" placeholder="이메일"><br>
        <h6></h6>
    <input type="tel" name="memberMobile" placeholder="전화번호"><br>
        <h6></h6>
    <input type="file" name="memberProfile" placeholder="첨부파일"><br>
        <h6></h6>
        <input type="submit" value="회원가입">
    </form>

</div>
</body>
<script>
    function duplicateCheck(){
    const memberId= document.getElementById("memberId").value;
    const duplicate=document.getElementById("duplicate");
    $.ajax({
        type:"post",
        url:"/member/duplicate-check",
        data:{"memberId":memberId},
        dataType:"text",
        success: function (IdCheck){

            if(IdCheck=="yes"){
                duplicate.style.color="green"
                duplicate.innerHTML="사용가능한 아이디입니다"

            }else{
                duplicate.style.color="red"
                duplicate.innerHTML="이미사용중이거나 탈퇴한 아이디입니다"
            }



        },
        error: function(){console.log("중복아이디")}

    })
    }
</script>
</html>
