<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link href="${pageContext.request.contextPath}/css/authstyle.css" rel="stylesheet" type="text/css">
  <title>Log In</title>
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
  <div class="box-login col-12">
    <div class="box-1-login col-12">
      <h1>Log In</h1>
      <hr>
      <c:if test="${errorMessage != null}">
        <p><c:out value="${errorMessage}"/></p>
      </c:if>
      <form method="post" action="/login">
        <table>
          <tr>
            <td>
              <label for="username">
                <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16" style="color: #0c97ce">
                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path>
                </svg>
               </label>
            </td>
            <td><input type="text" id="username" name="username" class="form-control" placeholder="Username"/></td>
          </tr>
          <tr>
            <td>
              <label for="password">
                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-unlock" viewBox="0 0 16 16" style="color: #0c97ce">
                    <path d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0 0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2zM3 8a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1H3z"></path>
                </svg>
            </label>
            </td>
            <td><input type="password" id="password" name="password" class="form-control" placeholder="Password"/></td>
          </tr>
          <tr>
            <td></td>
            <td>
              <input class="form-check-input check " type="checkbox" id="autoSizingCheck" name="remember-me">
              <label class="form-check-label" for="autoSizingCheck">Remember me!</label>
            </td>
          </tr>
          <tr>
            <td><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></td>
            <td><button type="submit" class="btn">Log In</button></td>
          </tr>
        </table>
        <c:if test="${logoutMessage != null}">
          <h6><c:out value="${logoutMessage}"/></h6>
        </c:if>
      </form>
    </div>
  </div>
</div>

</body>
</html>

