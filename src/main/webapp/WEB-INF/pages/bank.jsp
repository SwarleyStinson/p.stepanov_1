<%--suppress ALL --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@page session="true" contentType="text/html; charset=utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Admin page</title>
    <style>
        .allfields {
            padding: 15px;
            margin-bottom: 10px;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #a94442;
            background-color: #d9edf7;
            border-color: #bce8f1;
    </style>
</head>

<body>
<h3>Добро пожаловать : ${pageContext.request.userPrincipal.name} | <a href="javascript:formSubmit()"> Logout</a></h3>

<c:set var="isUpdate" value="1"/>
<c:set var="isCreate" value="1"/>
<c:set var="currentPage" value="${currentPage}" scope="session"/>

<c:url value="/j_spring_security_logout" var="logoutUrl"/>

<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>


<%-- Control Button Panel --%>
<div align="left">
    <c:url value="/client" var="clientController"/>
    <c:url value="/orders" var="ordersController"/>
    <c:url value="/bank" var="bankController"/>

    <td><a href="${clientController}">Client</a></td>
    <td><a href="${bankController}">Bank</a></td>
    <td><a href="${ordersController}">Orders</a></td>
</div>

<%-- Tablepage Control Buttons --%>
<div align="center">
    <%--
            Change Command:  1 - begin; 2 - down; 3 - up; 4 - end
    --%>
    <sf:form>
        <tr>
            <td>
                <sf:form>
                    <input type="hidden" value=1 name="currentPage">
                    <input type="submit" value="В начало">
                </sf:form>
            </td>

            <td>
                <sf:form>
                    <input type="hidden" value=2 name="currentPage">
                    <input type="submit" value="предыдущая">
                </sf:form>
            </td>
            <td>
                <sf:form>
                    <input type="hidden" value=3 name="currentPage">
                    <input value="следующая" type="submit">
                </sf:form>
            </td>
            <td>
                <sf:form>
                    <input type="hidden" value=4 name="currentPage">
                    <input type="submit" value="В конец">
                </sf:form>
            </td>
        </tr>
    </sf:form>

</div>


<script>
    function toggle() {
        if (document.getElementById("hidethis").style.display == 'none') {
            document.getElementById("hidethis").style.display = '';
        } else {
            document.getElementById("hidethis").style.display = 'none';
        }
    }
    function toggleToo() {
        if (document.getElementById("hidethistoo").style.display == 'none') {
            document.getElementById("hidethistoo").style.display = '';
        } else {
            document.getElementById("hidethistoo").style.display = 'none';
        }
    }
</script>

<div align="center">
    <table id="bank_table" align="center" border="1" width="1000" cellpadding="05" cellspacing="0">
        <tr bordercolor="black">
            <th align="center" width="5">ID</th>
            <th width="40">NAME</th>
            <th width="10">ADRESS</th>
            <th width="10">PAYSYSTEM</th>
        </tr>
        <c:forEach items="${bankList}" var="b">
            <tr>
                <td align="center" width="5"> ${b.id}</td>
                <td width="40">${b.name}</td>
                <td width="10">${b.address}</td>
                <td width="10">${b.paySystem}</td>
                <td width="80">
                    <sf:form>
                        <input type="hidden" value="${b.id}" name="deleteByID">
                        <input type="submit" value="Удалить" align="center"/>
                    </sf:form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div align="center">
    <sf:form>
        <input onclick="toggle(), toggleToo()" type="button" value="изменить/добавить"/>
    </sf:form>
</div>
<%-- изменение строки --%>
<div align="center">
    <c:if test="${not empty allfields}">
        <div class="allfields" align="center">${allfields}</div>
    </c:if>

    <sf:form id="hidethis" method="post" style="display: none" name="setForm">
        <div class="allfields" align="center">Введите новые данные Банка:</div>
        <tr>
            <td>ID:</td>
            <td width="5"><input name="id" type="text" width="5" required pattern="^[0-9]+$" autofocus/></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input name="name" type="text" width="5" required pattern="^[a-zA-Z\s]+$"/></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td width="15"><input name="address" type="text" width="15" required pattern="^[a-zA-Z\s]+$"/></td>
        </tr>
        <tr>
            <td>Pay Systems:</td>
            <td><input name="paySystem" type="text" width="10" formenctype="application/x-www-form-urlencoded" required
                       pattern="^[a-zA-Z\s]+$"/></td>
        </tr>

        <input type="hidden" value="${isUpdate}" name="isUpdate">
        <td width="10"><input type="submit" value="Сохранить изменения"/></td>

    </sf:form>
</div>

<%-- Добавление банка --%>
<div align="center">


    <sf:form id="hidethistoo" method="post" name="addForm">
        <div class="allfields" align="center">Введите данные нового Банка:</div>
        <tr>
            <td>Name:</td>
            <td><input name="name" type="text" width="5" required pattern="^[a-zA-Z\s]+$" autofocus/></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input name="address" type="text" width="15" required pattern="^[a-zA-Z\s]+$"/></td>
        </tr>
        <tr>
            <td>Pay System:</td>
            <td><input name="paySystem" type="text" width="10" formenctype="application/x-www-form-urlencoded" required
                       pattern="^[a-zA-Z\s]+$"/></td>
        </tr>

        <tr>
            <input type="hidden" value="${isCreate}" name="isCreate">
            <td><input type="submit" value="Добавить Банк"/></td>
        </tr>
    </sf:form>
</div>


<%--<div align="center">--%>
<%--<c:url value="/excel" var="excelController"/>--%>
<%--<c:url value="/pdf" var="pdfController"/>--%>

<%--<td>Скачать таблицу в формате:</td>--%>
<%--<td><a href="${excelController}">Excel</a></td>--%>
<%--<td><a href="${pdfController}">PDF</a></td>--%>

<%--</div>--%>

</body>
</html>