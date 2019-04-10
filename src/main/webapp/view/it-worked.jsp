<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%--
  Created by IntelliJ IDEA.
  User: Ooku
  Date: 2019-04-07
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test confirmation page</title>
</head>
<body>
<h2>It worked! :)</h2>
<div>
    <p>
        <%
            // v. - na ArrayLiście
            List<String> seatsList = (List<String>) request.getSession().getAttribute("cart");
            for (int i = 0; i < seatsList.size(); i++) {
                System.out.println("Miejsce: " + seatsList.get(i));
            }
            /*// v. - na setcie
            Set<String> seatsSet = (Set<String>) request.getSession().getAttribute("cart");
            for (String s : seatsSet) {
                System.out.println("Miejsce: " + s);
            }*/
        %>
    </p>
</div>
</body>
</html>
