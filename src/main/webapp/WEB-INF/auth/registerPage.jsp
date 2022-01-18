<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="${pageContext.request.contextPath}/css/authstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container col-12">
        <div class="nav">
            <h1>Air<span>~</span>Line</h1>
            <ul>
                <li><a href="/home">Home</a></li>
                <li><a href="/registration">Register</a></li>
                <li><a href="/login">Log in</a></li>
            </ul>
        </div>
    <div class="box-register">
        <div class="box-register-1">
            <h1>Register</h1>
            <hr>
            <p><form:errors path="user.*"/></p>
            <form:form method="POST" action="/registration" modelAttribute="user">
                <table>
                    <tr>
                        <td><form:label path="firstName">First Name:</form:label></td>
                        <td><form:input type="text" path="firstName" class="form-control" placeholder="Required Field"/></td>
                    </tr>
                    <tr>
                        <td><form:label path="lastName">Last Name:</form:label></td>
                        <td><form:input type="text" path="lastName" class="form-control" placeholder="Required Field"/></td>
                    </tr>
                    <tr>
                        <td><form:label path="username">Username*:</form:label></td>
                        <td><form:input type="email" path="username" class="form-control" placeholder="eg.test@mail.com.."/></td>
                    </tr>
                    <tr>
                        <td><form:label path="num_of_phone">Phone Number*:</form:label></td>
                        <td><form:input type="number" path="num_of_phone" class="form-control" placeholder="eg.(0)123456789.."/></td>
                    </tr>
                    <tr>
                        <td><form:label path="nationality">Nationality*:</form:label></td>
                        <td><form:input type="text" path="nationality" class="form-control" placeholder="Country"/></td>
                    </tr>
                    <tr>
                        <td><form:label path="password">Password*:</form:label></td>
                        <td><form:password path="password" class="form-control" placeholder="Enter password.."/></td>
                    </tr>
                    <tr>
                        <td><form:label path="confirmPassword">Confirm Password*:</form:label></td>
                        <td><form:password path="confirmPassword" class="form-control" placeholder="Again password.."/></td>
                    </tr>
                </table>
                <br>
                <input type="submit" class="btn" value="Register"/>
                <p style="text-align: center;color: black;font-size: 18px;font-weight: 600">or</p>
                <button type="button" class="login_btn" ><a href="/login">Log In</a></button>
            </form:form>
        </div>
    </div>
<%--    <div class="footer">--%>
<%--        <p>All copyright AirLine Reservation System 2021!</p>--%>
<%--    </div>--%>
</div>
</body>
</html>

