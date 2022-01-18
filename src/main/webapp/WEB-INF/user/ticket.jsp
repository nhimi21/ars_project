<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airline System</title>
    <link href="${pageContext.request.contextPath}/css/tickstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container col-12">
    <div class="nav">
        <h1>Air<span>~</span>Line</h1>
        <form id="logoutForm" method="POST" action="/logout">
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/user">Search</a></li>
                <li><a href="/user/detais">Details</a></li>
                <li><a><c:out value="${currentUser.firstName}"/></a></li>
                <li>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Log Out" class="logout"/>
                </li>
            </ul>
        </form>
    </div>
    <div class="txt-first">
        <h1>Hello</h1>
        <p>
            Where do you want to explore?
        </p>
    </div>
   <div class="search">
       <form action="/songs/search">
           <label>
               <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                   <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"></path>
                   <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"></path>
               </svg>
               Leaving From
               <input type="text" name="dep_city" placeholder="From" class="form-control"/>
           </label>
           <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5z"></path>
           </svg>
           <label>
               <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                   <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"></path>
                   <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"></path>
               </svg>
               Going To
               <input type="text" name="arri_city" placeholder="To" class="form-control"/>
           </label>
           <label>
               <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
                   <path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"></path>
                   <path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"></path>
               </svg>
               Departing
               <input type="date" name="dep_date"  class="form-control"/>
           </label>
           <label>
               <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16" >
                   <path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"></path>
                   <path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"></path>
               </svg>
               Returning
               <input type="date" name="arri_date" class="form-control" />
           </label>

           <i class="fa-plane"></i>
           <button class="btn">Search</button>
       </form>
   </div>

    <br>
    <div class="img-box col-">
        <div>
            <h2>Berlin, Germany</h2>
            <img src="${pageContext.request.contextPath}/img/berlin.jpg" alt="berlin" >
            <p>Please note that in Berlin the 2G rule applies to visitors aged 18 and over.
                This means that only vaccinated or recovered persons are allowed to restaurants, cultural institutions,
                in hotels and shops (except those for basic services). cultural institutions
            </p>
            <button type="button" class="btn btn-danger" >Review</button>
        </div>
        <div>
            <h2>Paris, France</h2>
            <img src="${pageContext.request.contextPath}/img/paris.jpg" alt="paris" >
            <p>
                It is worth remembering that the shops in Paris have put in place a reinforced sanitary protocol in order to provide
                a shopping experience in complete serenity: information posted outside on the conditions of access to the shop,
                respect for the gauge.
            </p>
            <button type="button" class="btn btn-danger">Review</button>
        </div>
        <div>
            <h2>Vienna, Austrian</h2>
            <img src="${pageContext.request.contextPath}/img/viena.jpg" alt="viena" >
            <p>
                The Austrian capital is world-famous for its rich cultural and historical heritage that can be sampled in the 100 museums or
                just by strolling the streets of the old city centre that belongs to the UNESCO world cultural heritage.
                Vienna is known as one of the music capitals of the world.
            </p>
            <button type="button" class="btn btn-danger">Review</button>
        </div>

    </div>
    <br>
    <div class="dis">
        <fieldset>
            <legend>How can I Book Airline Tickets Online?</legend>
            <p>
                Compare plane ticket prices at a glance from a large inventory of carriers on Expedia.
                You can get cheap flights by staying flexible with travel dates,
                carriers, and nonstop/layover flights to get the best price. Insider tip:
                Become a member (it’s free!) to earn rewards back on every booking.
                We make your travel stress free and source incredible airfare deals,
                so you can sit back, relax, and start your vacation or business trip.
                Mixing and matching airlines and fare types could help save money on airfare to your destination.
                Easily compare prices on carriers, arrival and departure dates,
                airplane cabin class, and more when you book with Expedia.
            </p>
        </fieldset>
    </div>
    <br>
    <div class="img-box-1 col-">
        <div>
            <h2>London. UK</h2>
            <img src="${pageContext.request.contextPath}/img/london.jpg" alt="london">
            <p>
                Welcome to London! Discover the best of London with Visit London, the official guide to England’s exciting capital. Find things to do in London, from iconic sightseeing spots and fun-filled days out to top restaurants,
                theatre and unmissable London events. If you’re not able to visit just yet,.
            </p>
            <button type="button" class="btn btn-danger">Review</button>
        </div>
        <div>
            <h2>Istanbul, Turkey</h2>
            <img src="${pageContext.request.contextPath}/img/istam.jpg" alt="istam" >
            <p>
                Istanbul is a major city in Turkey that straddles Europe and Asia across the Bosphorus Strait. Its Old City reflects cultural influences of the many empires that once ruled here. In the Sultanahmet district, the open-air,
                Roman-era Hippodrome was for centuries the site of chariot races, and Egyptian obelisks also remain.
            </p>
            <button type="button" class="btn btn-danger">Review</button>
        </div>
    </div>
    <br>
    <div class="footer">
        <p>© 2022 Airline System.  All rights reserved.</p>
    </div>
</div>
</body>
</html>


