<%--
  Created by IntelliJ IDEA.
  User: p.stepanov
  Date: 09.02.2017
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello Admin!</title>
</head>
<body>
<h1 >Hello ...</h1>
<h1 >Access to this page only for user with "ROLE_ADMIN". </h1>
<form action="login" method="post">
    <input type="submit" value="Sign Out"/>
</form>
</body>
</html>
