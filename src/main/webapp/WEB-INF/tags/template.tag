<%@ tag description="Template Tag" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype>
<html>
    <head>
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
        <script src="<c:url value="/resources/script/bookUtil.js" />"></script>

        <title>Book Manager</title>

    </head>
    <body>
        <div class="content">
            <h1>Book Manager</h1>

            <div class="login-link-container">
                <sec:authorize access="isAnonymous()">
                    <p>
                        <a class="btn btn-primary" href="/j_spring_security_check">Sign In</a>
                    </p>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <a class="btn btn-default" href="/j_spring_security_logout">Sign Out</a>
                </sec:authorize>
            </div>

            <jsp:doBody/>
        </div>
    </body>
</html>