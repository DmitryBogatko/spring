<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<t:template_event>
  <form:form method="post" action="addEvent" commandName="event">
    <table>
      <tr>
        <td><form:label path="subject">
          Subject
        </form:label></td>
        <td><form:input path="subject"/></td>
        <td><form:errors cssClass="error" path="subject"></form:errors> </td>
      </tr>
      <tr>
        <td><form:label path="description">
          Description
        </form:label>
        </td>
        <td><form:input path="description"/></td>
        <td><form:errors cssClass="error" path="description"></form:errors> </td>
      </tr>
      <tr>
        <td><form:label path="startDate">
          StartDate
        </form:label>
        </td>
        <td><form:input path="startDate"/></td>
        <td><form:errors cssClass="error" path="startDate"></form:errors> </td>
      </tr>
      <tr>
        <td><form:label path="startTime">
          Start Time
        </form:label>
        </td>
        <td><form:input path="startTime"/></td>
        <td><form:errors cssClass="error" path="startTime"></form:errors> </td>
      </tr>
      <tr>
        <td><form:label path="endDate">
          End Date
        </form:label>
        </td>
        <td><form:input path="endDate"/></td>
        <td><form:errors cssClass="error" path="endDate"></form:errors> </td>
      </tr>
      <tr>
        <td><form:label path="endTime">
          End Time
        </form:label>
        </td>
        <td><form:input path="endTime"/></td>
        <td><form:errors cssClass="error" path="endTime"></form:errors> </td>
      </tr>
      <tr>
        <td colspan="2"><input type="submit" value="Add Event"/></td>
      </tr>
    </table>
  </form:form>
</t:template_event>
