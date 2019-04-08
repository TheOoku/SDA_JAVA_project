<%--
  Created by IntelliJ IDEA.
  User: Ooku
  Date: 2019-04-06
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

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
<nav></nav>

<section>
    <article>
        <div>
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
                    <th>21</th>
                    <th>22</th>
                    <th>23</th>
                    <th>24</th>
                    <th>25</th>
                    <th>26</th>
                    <th>27</th>
                    <th>28</th>
                    <th>29</th>
                    <th>210</th>
                    <th>211</th>
                </tr>
                <tr>
                    <th>31</th>
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
