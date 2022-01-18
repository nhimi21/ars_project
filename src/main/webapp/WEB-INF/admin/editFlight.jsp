<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight</title>
    <link href="${pageContext.request.contextPath}/css/flightstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container col-12">
    <div class="nav">
        <h2>Air<span>~</span>Line System</h2>
        <form id="logoutForm" method="POST" action="/logout">
            <ul>
                <li><a href="/admin">Home</a></li>
                <li><a href="/admin/airport">Airport</a></li>
                <li><a href="/admin/flight">Flight</a></li>
                <li><a href="/admin/invoive">Invoice</a></li>
                <li><a><c:out value="${currentUser.firstName}"/></a></li>
                <li>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Log Out" class="logout"/>
                </li>


            </ul>
        </form>
    </div>
    <div class="main">
        <div class="add-flight">
            <h2>Update or Delete Flight</h2>
            <hr>
            <form:form method="POST" action="/admin/flight" modelAttribute="flight">
                <input type="hidden" name="_method" value="put">
                <div class="form-group">
                    <form:label path="name">Flight Name:</form:label>
                    <form:input type="text" class="form-control" path="name" placeholder="Enter flight name"/>
                    <form:errors path="name"/>
                </div>
                <br>
                <div>
                    <label>Departure Airport:</label>
                    <label>
                        <select name="dep_airport_name"  class="form-control" >
                            <c:forEach items="${airport}" var="air">
                                <option value="${air.name}">
                                        ${air.name}
                                </option>
                            </c:forEach>
                        </select>
                    </label>
                    <label>Arrival  Airport:</label>
                    <label>
                        <select name="arri_airport_name"  class="form-control">
                            <c:forEach items="${airport}" var="air">
                                <option value="${air.name}">
                                        ${air.name}
                                </option>
                            </c:forEach>
                        </select>
                    </label>
                    <label>Departure City: </label>
                    <label>
                        <select name="dep_city"  class="form-control">
                            <c:forEach items="${airport}" var="air">
                                <option value="${air.city}">
                                        ${air.city}
                                </option>
                            </c:forEach>
                        </select>
                    </label>
                    <label>Arrival City: </label>
                    <label>
                        <select name="arri_city"  class="form-control">
                            <c:forEach items="${airport}" var="air">
                                <option value="${air.city}">
                                        ${air.city}
                                </option>
                            </c:forEach>
                        </select>
                    </label>
                </div>
                <br>
                <div>
                    <form:label path="dep_date">Departure Date:</form:label>
                    <form:input type="date" class="form-control" path="dep_date" />
                    <form:errors path="dep_date"/>
                </div>
                <div>
                    <form:label path="dep_time">Departure Time:</form:label>
                    <form:input type="time" class="form-control" path="dep_time" />
                    <form:errors path="dep_time"/>
                </div>
                <div>
                    <form:label path="arri_date">Arrival Date:</form:label>
                    <form:input type="date" class="form-control" path="arri_date" />
                    <form:errors path="arri_date"/>
                </div>
                <div>
                    <form:label path="arri_time">Arrival Time:</form:label>
                    <form:input type="time" class="form-control" path="arri_time" />
                    <form:errors path="arri_time"/>
                </div>
                <div>
                    <form:label path="ticket_price">Ticket Price:</form:label>
                    <form:input type="float" class="form-control" path="ticket_price" placeholder="Enter price" />
                    <form:errors path="ticket_price"/>
                </div>
                <br>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-info">Edit Flight</button>
                <button type="button" class="btn btn-info"><a href="/admin/flight">Back</a></button>
            </form:form>
            <form action="/admin/flight/${flight.id}/delete" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="submit" class="btn btn-danger" value="Delete"/>
                <input type="hidden" name="_method" value="delete">
            </form>
        </div>
    </div>
    <br>
    <div class="footer">
        <p>All copyright AirLine Reservation System 2021!</p>
    </div>
</div>

</body>
</html>
