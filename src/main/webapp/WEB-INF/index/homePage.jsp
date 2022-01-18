<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airline System</title>
    <link href="${pageContext.request.contextPath}/css/userstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container col-12">
    <div class="nav">
        <h1>Air<span>~</span>Line</h1>
        <form id="logoutForm" method="POST" action="/logout">
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/user">Client</a></li>
                <li><a href="/admin">Admin</a></li>
                <li><a><c:out value="${currentUser.firstName}"/></a></li>
                <li>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Log Out" class="logout"/>
                </li>
            </ul>
        </form>
    </div>
    <div class="dis">
        <h1>Welcome to Airline Reservation System</h1>
        <fieldset>
            <legend>1-What is the Airline Industry?</legend>
            <p>
                The airline industry encompasses a wide range of businesses, called airlines, which offer air transport services for paying customers or business partners.
                These air transport services are provided for both human travellers and cargo, and are most commonly offered via jets, although some airlines also use helicopters.
                Airlines may offer scheduled and/or chartered services and the airline industry forms a key part of the wider travel industry,
                providing customers with the ability to purchase seats on flights and travel to different parts of the world.
                The airline industry offers a variety of career paths, including pilots, flight attendants and ground crew.
            </p>
        </fieldset>
    </div>
    <div class="img-box col-">
        <img src="${pageContext.request.contextPath}/img/berlin.jpg" alt="berlin" width="240" height="200">
        <img src="${pageContext.request.contextPath}/img/paris.jpg" alt="paris" width="240" height="200">
        <img src="${pageContext.request.contextPath}/img/viena.jpg" alt="viena" width="240" height="200">
        <img src="${pageContext.request.contextPath}/img/london.jpg" alt="london" width="240" height="200">
        <img src="${pageContext.request.contextPath}/img/istam.jpg" alt="istam" width="240" height="200">
    </div>
    <div class="dis">
        <fieldset>
            <legend>2-How can I Book Airline Tickets Online?</legend>
            <p>
                Compare plane ticket prices at a glance from a large inventory of carriers on Expedia.
                You can get cheap flights by staying flexible with travel dates,
                carriers, and nonstop/layover flights to get the best price. Insider tip:
                Become a member (it’s free!) to earn rewards back on every booking.
                We make your travel stress free and source incredible airfare deals,
                so you can sit back, relax, and start your vacation or business trip.
                Mixing and matching airlines and fare types could help save money on airfare to your destination.
                Easily compare prices on carriers, arrival and departure dates,
                airplane cabin class, and more when you book with Expedia. Booking your plane ticket on a Sunday,
                and departing on Thursday or Friday, could possibly save you money*, based on historical data
            </p>
        </fieldset>
    </div>
    <div class="img-box col-">
        <img src="${pageContext.request.contextPath}/img/air4.jpg" alt="paris" width="240" height="200">
        <img src="${pageContext.request.contextPath}/img/air6.jpg" alt="london" width="240" height="200">
        <img src="${pageContext.request.contextPath}/img/air5.jpg" alt="viena" width="240" height="200">
        <img src="${pageContext.request.contextPath}/img/air3.jpg" alt="berlin" width="240" height="200">
        <img src="${pageContext.request.contextPath}/img/airline.jpg" alt="istam" width="240" height="200">
    </div>
    <br>
    <div class="footer">
        <p>© 2022 Airline System.  All rights reserved.</p>
    </div>
</div>
</body>
</html>


