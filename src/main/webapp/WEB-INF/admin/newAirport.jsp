<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airport</title>
    <link href="${pageContext.request.contextPath}/css/airstyle.css" rel="stylesheet" type="text/css">
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
                <li><a href="/admin/invoive">Invoice</a></li>
                <li>
                    <a><c:out value="${currentUser.firstName}"/></a></li>
                <li>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Log Out" class="logout"/>
                </li>
            </ul>
        </form>
    </div>
    <div class="air-tab">
        <h2>Airports List</h2>
        <hr>
        <table class="table table-hover">
            <thead >
            <tr>
                <th>Airport Code</th>
                <th>Name</th>
                <th>State</th>
                <th>City</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${airports}" var="airport">
                <tr>
                    <td>${airport.port_code}</td>
                    <td>${airport.name}</td>
                    <td>${airport.state}</td>
                    <td>${airport.city}</td>
                    <td>${airport.address}</td>
                    <td>
                        <a href="/admin/${airport.id}/edit">Edit</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="main">
        <div class="air col-12">
            <h2>Add Airport</h2>
            <hr>
            <form:form method="POST" action="/admin/airport" modelAttribute="airport">
                <div class="form-group">
                    <form:label path="port_code">Airport Code:</form:label>
                    <form:input type="number" path="port_code" cssClass="form-control" placeholder="Enter Airport Code"/>
                    <form:errors path="port_code"/>
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
                <form:input path="creator" type="hidden" value="${userID}"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="submit" value="Create Airport" class="btn btn-info"/>
            </form:form>
        </div>
    </div>
    <br>
    <div class="footer">
        <p>© 2022 Airline System.  All rights reserved.</p>
    </div>
</div>

</body>
</html>
