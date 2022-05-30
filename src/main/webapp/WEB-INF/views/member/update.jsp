<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-27
  Time: 오후 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>


<body>
<form method="post" action="/member/update" name="update1" enctype="multipart/form-data" >
    <input type="text" name="Id" value="${updateId.id} "hidden>
    <h6>아이디</h6>
    <input type="text" name="memberId" value="${updateId.memberId} "readonly>
    <h6>비밀번호</h6>
    <input type="password" name="memberPassword" id="passwordConfirm"><br>
    <h6>이름</h6>
    <input type="text" name="memberName" value="${updateId.memberName}"> <br>
    <h6>이메일</h6>
    <input type="email" name="memberEmail" value="${updateId.memberEmail}"><br>
    <h6>전화번호</h6>
    <input type="tel" name="memberMobile" value="${updateId.memberMobile}"><br>
    <h6>프로필</h6>
    <input type="file" name="memberProfile" value="${updateId.memberProfile}"><br>
    <h6></h6>
    <input type="button" value="수정" onclick="update()">
</form>

</body>
<script>

    function update(){
        const userPassword=  document.getElementById("passwordConfirm").value;
        const DBPassword ='${updateId.memberPassword}';
        if(userPassword==DBPassword){
            update1.submit();
        }
    }
</script>
</html>
