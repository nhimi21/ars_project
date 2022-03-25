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
                        <td>${flight.flightNumber}</td>
                        <td>${flight.departureAirportName}</td>
                        <td>${flight.arrivalAirportName}</td>
                        <td>${flight.departureCity}</td>
                        <td>${flight.arrivalCity}</td>
                        <td>${flight.departureDate}</td>
                        <td>${flight.departureTime}</td>
                        <td>${flight.arrivalDate}</td>
                        <td>${flight.arrivalTime}</td>
                        <td>${flight.pnrCode}</td>
                        <td>$ ${flight.ticketPrice}</td>
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
                        <form:label path="flightNumber">Flight Number:</form:label>
                        <form:input type="number" class="form-control" path="flightNumber" placeholder="Enter flight number"/>
                        <form:errors path="flightNumber"/>
                    </div>
                    <br>
                    <div>
                        <label>Departure Airport:</label>
                        <label>
                            <select name="departureAirportName"  class="form-control" >
                                <c:forEach items="${airport}" var="air">
                                    <option value="${air.name}">
                                            ${air.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </label>
                        <label>Arrival  Airport:</label>
                        <label>
                            <select name="arrivalAirportName"  class="form-control">
                                <c:forEach items="${airport}" var="air">
                                    <option value="${air.name}">
                                            ${air.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </label>
                        <label>Departure City: </label>
                        <label>
                            <select name="departureCity"  class="form-control">
                                <c:forEach items="${airport}" var="air">
                                    <option value="${air.city}">
                                            ${air.city}
                                    </option>
                                </c:forEach>
                            </select>
                        </label>
                        <label>Arrival City: </label>
                        <label>
                            <select name="arrivalCity"  class="form-control">
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
                        <form:label path="departureDate">Departure Date:</form:label>
                        <form:input type="date" class="form-control" path="departureDate" />
                        <form:errors path="departureDate"/>
                    </div>
                    <div>
                        <form:label path="departureTime">Departure Time:</form:label>
                        <form:input type="time" class="form-control" path="departureTime" />
                        <form:errors path="departureTime"/>
                    </div>
                    <div>
                        <form:label path="arrivalDate">Arrival Date:</form:label>
                        <form:input type="date" class="form-control" path="arrivalDate" />
                        <form:errors path="arrivalDate"/>
                    </div>
                    <div>
                        <form:label path="arrivalTime">Arrival Time:</form:label>
                        <form:input type="time" class="form-control" path="arrivalTime" />
                        <form:errors path="arrivalTime"/>
                    </div>
                    <div>
                        <form:label path="pnrCode">PNR Code:</form:label>
                        <form:input type="float" class="form-control" path="pnrCode" placeholder="Enter price" />
                        <form:errors path="pnrCode"/>
                    </div>
                    <div>
                        <form:label path="ticketPrice">Ticket Price:</form:label>
                        <form:input type="float" class="form-control" path="ticketPrice" placeholder="Enter price" />
                        <form:errors path="ticketPrice"/>
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
