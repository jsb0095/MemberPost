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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>


<body>
<form method="post" action="/member/update" name="update1" enctype="multipart/form-data">
    <div class="position-absolute top-50 start-50 translate-middle  d-grid mx-auto">
    <input type="text" name="Id" value="${updateId.id} "hidden><br>
    <h6><b>아이디</b></h6>
    <input type="text" style="background-color:#e9ecef" name="memberId" value="${updateId.memberId} "readonly><br>
    <h6><b>비밀번호</b></h6>
    <input type="password" style="background-color:#e9ecef" name="memberPassword" id="passwordConfirm"><br>
    <h6><b>이름</b></h6>
    <input type="text" style="background-color:#e9ecef" name="memberName" value="${updateId.memberName}"> <br>
    <h6><b>이메일</b></h6>
    <input type="email" style="background-color:#e9ecef" name="memberEmail" value="${updateId.memberEmail}"><br>
    <h6><b>전화번호</b></h6>
    <input type="tel" style="background-color:#e9ecef" name="memberMobile" value="${updateId.memberMobile}"><br>
    <h6><b>프로필사진</b></h6>
    <input type="file" style="background-color:#e9ecef"  class="form-control" id="inputGroupFile02" name="memberProfile" value="${updateId.memberProfile}"><br>
    <h6></h6>
    <input type="button"  class="btn btn-dark d-grid mx-auto" value="수정" onclick="update()">
    </div>
</form>

</body>
<script>

    function update(){
        const userPassword=  document.getElementById("passwordConfirm").value;
        const DBPassword ='${updateId.memberPassword}';
        if(userPassword==DBPassword){
            update1.submit();
        }else {
            alert("비밀번호가 일치하지않습니다!!")
        }
    }
</script>
</html>
