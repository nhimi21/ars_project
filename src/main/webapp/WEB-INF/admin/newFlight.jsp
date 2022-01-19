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
            <div class="tab-flight col-12">
            <h2>Flights List</h2>
            <hr>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Flight No</th>
                        <th>Dep Airport</th>
                        <th>Arri Airport</th>
                        <th>Dep City</th>
                        <th>Arri City</th>
                        <th>Dep Date</th>
                        <th>Dep Time</th>
                        <th>Arri Date</th>
                        <th>Arri Time</th>
                        <th>Ticket Price</th>
                        <th>PNR Code</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${flights}" var="flight">
                    <tr>
                        <td>${flight.flight_num}</td>
                        <td>${flight.dep_airport_name}</td>
                        <td>${flight.arri_airport_name}</td>
                        <td>${flight.dep_city}</td>
                        <td>${flight.arri_city}</td>
                        <td>${flight.dep_date}</td>
                        <td>${flight.dep_time}</td>
                        <td>${flight.arri_date}</td>
                        <td>${flight.arri_time}</td>
                        <td>${flight.pnr_code}</td>
                        <td>$ ${flight.ticket_price}</td>
                        <td><a href="/admin/flight/${flight.id}/edit">Edit</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
            <div class="add-flight">
                <h2>Add Flight</h2>
                <hr>
                <form:form method="POST" action="/admin/flight" modelAttribute="flight">
                    <div class="form-group">
                        <form:label path="flight_num">Flight Name:</form:label>
                        <form:input type="number" class="form-control" path="flight_num" placeholder="Enter flight number"/>
                        <form:errors path="flight_num"/>
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
                        <form:label path="pnr_code">PNR Code:</form:label>
                        <form:input type="float" class="form-control" path="pnr_code" placeholder="Enter price" />
                        <form:errors path="pnr_code"/>
                    </div>
                    <div>
                        <form:label path="ticket_price">Ticket Price:</form:label>
                        <form:input type="float" class="form-control" path="ticket_price" placeholder="Enter price" />
                        <form:errors path="ticket_price"/>
                    </div>
                    <br>
<%--                    <form:input type="hidden" path="airport" value="${airId}" />--%>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-info">Create Flight</button>
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
