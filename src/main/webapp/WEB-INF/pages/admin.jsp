<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page session="true" contentType="text/html; charset=utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Admin page</title>
</head>

<body>
<h1>Title : ${title}</h1>
<h1>Message : ${message}</h1>


<c:url value="/j_spring_security_logout" var="logoutUrl"/>
<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>
<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>

<c:if test="${pageContext.request.userPrincipal.name != null}">
    <h2>

        Добро пожаловать : ${pageContext.request.userPrincipal.name} | <a
            href="javascript:formSubmit()"> Logout</a>
    </h2>
</c:if>

<div align="left">
    <input name="Client Database" type="button"/>
    <input name="Bank Database" type="button"/>
    <input name="Order Database" type="button"/>
</div>
<div align="center">

    <table id="client_table" align="center" border="1" width="1000" cellpadding="1" cellspacing="15">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>LOGIN</th>
            <th>PASSWORD</th>
            <th>EMAIL</th>
            <th>TYPE</th>
        </tr>
        <tr>
            <td> строка 1</td>
            <td> строка 1</td>
            <td> строка 1</td>
            <td> строка 1</td>
            <td> строка 1</td>
            <td> строка 1</td>
        </tr>
    </table>
</div>
<div align="center">

    <form:form method="post" commandName="t_client">
        <tr>
            <td>ID:</td>
            <td><input name="id" type="text" width="5"/></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input name="name" type="text" width="20"/></td>
        </tr>
        <tr>
            <td>Login:</td>
            <td><input name="login" type="text" width="20"/></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input name="password" type="text" width="20"/></td>
        </tr>
        <tr>
            <td>E-mail:</td>
            <td><input name="email" type="email" width="20"/></td>
        </tr>
        <tr>
            <td>Type:</td>
            <td><input name="type" type="text" width="10"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Добавить"/></td>
        </tr>
    </form:form>
</div>
</body>
</html>