<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<t:template_event>
    <c:if test = "${!empty events}">
        <table class ="event-list-table">
            <tr>
                <th>Subject</th>
                <th>Description</th>
                <th>Start date</th>
                <th>Start time</th>
                <th>End date</th>
                <th>End time</th>
                <sec:authorize access="hasRole('admin')">
                    <th>&nbsp;</th>
                </sec:authorize>

            </tr>
            <c:forEach items = "${events}" var = "event">
                <tr>
                    <td>${event.subject}</td>
                    <td>${event.description}</td>
                    <td>${event.startDate}</td>
                    <td>${event.startTime}</td>
                    <td>${event.endDate}</td>
                    <td>${event.endTime}</td>
                   <%-- <sec:authorize access="hasRole('admin')">
                        <td><a href="javascript:BookUtil.deleteBook(${book.id})">Delete</a></td>
                    </sec:authorize>--%>

                </tr>
            </c:forEach>
        </table>
    </c:if>
    <sec:authorize access="isAuthenticated()">
        <a href="/addEvent">Add Event</a>
    </sec:authorize>

</t:template_event>
