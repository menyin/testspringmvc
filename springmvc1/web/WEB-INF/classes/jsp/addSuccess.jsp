<%--
  Created by IntelliJ IDEA.
  User: win7
  Date: 2018/2/10
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<p>${name}</p>
<p>${age}</p>
<br>
<p>${user.name}++${user.age}</p>
<br>
<%--<p>${!empty userBirthDate?userBirthDate:""}</p>--%>
<fmt:formatDate value="${userBirthDate}" type="Date" dateStyle="medium"/>
<fmt:formatDate value="${userBirthDate}" type="Date" pattern="【yyyy年MM月dd日】" dateStyle="medium"/>

<%--接收List<User>--%>
<c:forEach items="${users}" var="user" varStatus="status">
    <p>第${status.count}个，${user.name}+${user.age}</p>
</c:forEach>
</body>
</html>
