<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Ooku
  Date: 2019-04-06
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/theme/style.css" />">

    <title>Sala - Rezerwacja - Teatr Sztampa</title>

    <!-- odniesienie do styli css zapisuejmy tak:
    <link rel="stylesheet" href="styles/style.css">
    -->

    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        th, td {
            padding-left: 12px;
            padding-right: 12px;
            padding-top: 7px;
            padding-bottom: 7px;
        }

        caption {
            display: table-caption;
            text-align: left;
            caption-side: top;
        }
    </style>
</head>
<body>
<!-- headerowi można nadać id="bold" i jeśli w style.css będzie odpowiednie formatowanie, to odniesie do tej sekcji -->
<header>
    <h1>Podgląd sali do dokonania rezerwacji</h1>
</header>
<!-- w navi mogą być przyciski do innych stron -->
<nav>
    <div>
        <p><a href="/view/it-worked.jsp">Podgląd sesji</a></p>
    </div>
</nav>

<section>
    <article>
        <div align="middle">
            <table>
                <thead>
                <tr>
                    <th colspan="11"><p align="middle">Dostępne miejsca</p></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach var="i" begin="1" end="11">
                        <td>
                            <!-- w tym ifie ma być kolorowanie tła komórki; czy to nie powinno być w znaczniku <td>? -->
                            <c:if test=""></c:if>
                            <form action="/booking" method="post">
                                <!-- dwie poniższe linie pakujemy w ifa różnicującego, czy miejsce jest kliknięte-zajęte, czy jeszcze nie -->
                                <input type="hidden" name="seat" value="<c:out value="${i}"/>"/>
                                <button type="submit">Miejsce: <c:out value = "${i}"/> </button>
                                <!-- poniżej dwie linie do obsługi miejsca po jego dodaniu do puli zajętych, kolorowanie przez .css w oparciu o nazwę klasy
                                <input type="hidden" name="seat_cancel" value="${i}"/>"/>
                                <button type="submit"><p class="seat_taken">X</p></button>
                                -->
                            </form>
                        </td>
                    </c:forEach>
                </tr>
                <tr>
                    <c:forEach items="${view_audience}" var="seat">
                        <td>${seat.id}</td>
                    </c:forEach>
                </tr>
                <tr>
                    <td>
                        <% List<String> seatsList = (List<String>) request.getSession().getAttribute("cart");
                            if (seatsList.contains("31")){ %>
                        <p background-color: blue>Zajęte</p>

                        <% } else {%>
                        <form action="/booking" method="post">
                            <input type="hidden" name="seat" value="31"/>
                            <button type="submit">Miejsce: 31</button>
                        </form>
                        <% } %>
                    </td>
                    <th>33</th>
                    <th>33</th>
                    <th>34</th>
                    <th>35</th>
                    <th>36</th>
                    <th>37</th>
                    <th>38</th>
                    <th>39</th>
                    <th>310</th>
                    <th>311</th>
                </tr>
                </tbody>
            </table>
        </div>
    </article>
</section>
<!-- może być też sekcja "aside" dla bocznej sekcji - "Defines content aside from the page content" -->
<aside></aside>
<br>

Zajęte krzesła: <% System.out.println(request.getSession().getAttribute("seat")); %>
<!-- jak działa <display>? -->
<display:table name="${sessionScope.cart}">

<br>
<br>
<footer>
    <div>
        Test znaków diakrytycznych:<br>
        <ul>
            ą, ć, ę, ł, ń, ó, ś<br>
            Ą, Ć, Ę, Ł, Ń, Ó, Ś<br>
        </ul>
    </div>
</footer>
</body>
</html>
