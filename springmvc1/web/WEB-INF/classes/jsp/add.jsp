<%--
  Created by IntelliJ IDEA.
  User: win7
  Date: 2018/2/10
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    pageContext.setAttribute("basePath", request.getContextPath());
%>
<body>
<h4>收集普通参数</h4>
<form action="${basePath}/hello/addParm.do" method="post">
    <p>姓名：<input type="text" name="name" value="jack"></p>
    <p>年龄：<input type="text" name="age" value="18"></p>
    <input type="submit" value="提交">
</form>
<h4>收集实体参数</h4>
<form action="${basePath}/hello/addUser.do" method="post">
    <p>姓名：<input type="text" name="name" value="Marry"></p>
    <p>年龄：<input type="text" name="age" value="17"></p>
    <input type="submit" value="提交">
</form>
<h4>收集实体参数并做日期字符串转换</h4>
<form action="${basePath}/hello/addUser_Date.do" method="post">
    <p>姓名：<input type="text" name="name" value="Marry"></p>
    <p>年龄：<input type="text" name="age" value="17"></p>
    <p>生日：<input type="text" name="birthDate" value="2018-02-10"></p>
    <input type="submit" value="提交">
</form>

<h4>收集数组参数</h4>
<form action="${basePath}/hello/addArrayParm.do" method="post">
    <input type="checkbox" name="ids" value="1">
    <input type="checkbox" name="ids" value="2">
    <input type="checkbox" name="ids" value="3">
    <input type="checkbox" name="ids" value="4">
    <input type="submit" value="提交">
</form>


<h4>收集list实体参数</h4>
<form action="${basePath}/hello/addUserList.do" method="post">
    <p>姓名：<input type="text" name="users[0].name" value="Marry">年龄：<input type="text" name="users[0].age" value="17"></p>
    <p>姓名：<input type="text" name="users[1].name" value="Jack">年龄：<input type="text" name="users[1].age" value="17"></p>
    <p>姓名：<input type="text" name="users[2].name" value="Lisa">年龄：<input type="text" name="users[2].age" value="17"></p>
    <input type="submit" value="提交">
</form>
<br>`
<input type="button" value="测试ajax请求返回bean2json" id="btnAjax">
</body>
<script src="${basePath}/js/jquery-1.10.2.min.js"></script>
<script>
    $('#btnAjax').click(function () {
        $.post('${basePath}/hello/ajax.do', {age:12},function (data) {
            debugger;
            console.log(data);
        });
    });

</script>
</html>
