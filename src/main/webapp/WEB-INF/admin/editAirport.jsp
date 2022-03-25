<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/css/airstyle.css" rel="stylesheet" type="text/css">
    <title>Airport</title>
</head>
<body>
<div class="container col-12">
    <div class="nav">
        <h1>Air<span>~</span>Line</h1>
        <form id="logoutForm" method="POST" action="/logout">
            <ul>
                <li><a href="/admin">Home</a></li>
                <li><a href="/admin/airport">Airport</a></li>
                <li><a href="/admin/flight">Flight</a></li>
                <li><a href="/admin/invoice">Invoice</a></li>
                <li><a><c:out value="${currentUser.firstName}"/></a></li>
                <li>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Log Out" class="logout"/>
                </li>
            </ul>
        </form>
    </div>
    <div class="main">
        <div class="air col-12">
            <h2>Update or Delete Airport</h2>
            <hr>
            <form:form method="POST" action="/admin/${airport.id}/edit" modelAttribute="airport">
                <input type="hidden" name="_method" value="put">
                <div class="form-group">
                    <form:label path="airportCode">Airport Code:</form:label>
                    <form:input type="number" path="airportCode" cssClass="form-control" placeholder="Enter Airport Code"/>
                    <form:errors path="airportCode"/>
                </div>
                <div class="form-group">
                    <form:label path="name">Name:</form:label>
                    <form:input type="text" path="name" cssClass="form-control" placeholder="Enter Name"/>
                    <form:errors path="name"/>
                </div>
                <div class="form-group">
                    <form:label path="state">State:</form:label>
                    <form:input type="text" path="state" cssClass="form-control" placeholder="Enter State" />
                    <form:errors path="state"/>
                </div>
                <div class="form-group">
                    <form:label path="city">City:</form:label>
                    <form:input type="text" path="city" cssClass="form-control" placeholder="Enter City"/>
                    <form:errors path="city"/>
                </div>
                <div class="form-group">
                    <form:label path="address">Address:</form:label>
                    <form:textarea type="text" path="address" cssClass="form-control" placeholder="Enter Address"/>
                    <form:errors path="address"/>
                </div>
                <br>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="submit" value="Edit Airport" class="btn btn-info"/>
                <button type="button" class="btn btn-info"><a href="/admin/airport">Back</a></button>
            </form:form>
            <form action="/admin/${airport.id}/delete" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="submit" class="btn btn-danger" value="Delete"/>
                <input type="hidden" name="_method" value="delete">
            </form>
        </div>
    </div>
    <br>
    <div class="footer">
        <p>© 2022 Airline System.  All rights reserved.</p>
    </div>
</div>

</body>
</html>
