package hl.sztampa.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet (name = "BookingMainController", value = "/booking")
public class MainBookingServlet extends HttpServlet {

    // 1. doGet do przesłania rządania wyświetlenia strony, do JSP odpowiedzialnego za widok strony
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // XYZ będzie wywoływał z DB info o ilości i stanie (wolności) miejsc
        //req.setAttribute("view_audience", XYZ);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/view-audience.jsp");

        dispatcher.forward(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // inicjalizacja obiektu sesji, przez pobranie info o sesji z obiektu zapytania
        HttpSession session = req.getSession();

        // wyciągnięcie parametru z zapytania (tj. wybranego miejsca) żeby za chwilę dodać go do pozostałych na liście
        String seat = req.getParameter("seat");

        // pobranie z sesji listy z już zapisanymi tam miejscami ("koszyk" na miejsca)
        List<String> cart = (List<String>) session.getAttribute("cart");
        // castowanie wymuszone przez IDE, na wypadek gdyby wcześniej pod cart nie było listy Stringów

        // j. jednak nie mamy jeszcze koszyka (poszło pierwsze rządanie), to musimy go utworzyć
        if (cart == null){
            cart = new ArrayList<String>();
            session.setAttribute("cart", cart);
        }

        // wreszcie dodajemy do "koszyka" kolejne miejsce
        cart.add(seat);

        // na koniec wstawiamy zaktualizowaną listę do sesji
        session.setAttribute("cart", cart);

        // było:
        // session.setAttribute("seat", req.getParameter("seat"));

        // już chyba nie potrzebne
        //req.setAttribute("taken", session.getAttribute("seat"));


        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/view-audience.jsp");
        dispatcher.forward(req, resp);
    }
}
