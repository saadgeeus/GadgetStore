<%@ page import="com.gadgetstore.model.Gadget" %>
<%@ page import="java.util.List" %>
<html>
<head><title>Gadget Store</title></head>
<body>
    <h1>Available Gadgets</h1>
    <ul>
        <%
            List<Gadget> gadgets = (List<Gadget>) request.getAttribute("gadgetList");
            for (Gadget g : gadgets) {
        %>
        <li><%= g.getName() %> - $<%= g.getPrice() %></li>
        <% } %>
    </ul>
    <a href="add.jsp">Add New Gadget</a>
</body>
</html>
