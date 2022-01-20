<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airline System</title>
    <link href="${pageContext.request.contextPath}/css/adstyle.css" rel="stylesheet" type="text/css">
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
    <div>
        <h2>Invoice details of clients</h2>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Invoice No</th>
                <th>Flight No</th>
                <th>Dep City</th>
                <th>Arri City</th>
                <th>Dep Date</th>
                <th>Arri Date</th>
                <th>PNR</th>
                <th>Ticket Price</th>
                <th>Number of Person</th>
                <th>Total price</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ticket}" var="tick">
                <tr>
                    <td>${tick.ticketNumber}</td>
                    <td>${tick.flight.flightNumber}</td>
                    <td>${tick.flight.departureCity}</td>
                    <td>${tick.flight.arrivalCity}</td>
                    <td>${tick.flight.departureDate}</td>
                    <td>${tick.flight.arrivalDate}</td>
                    <td>${tick.flight.pnrCode}</td>
                    <td>${tick.flight.ticketPrice}</td>
                    <td>${tick.numOfPerson}</td>
                    <td>${tick.totalPrice}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

