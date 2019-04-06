package hl.sztampa.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "BookingMainController", value = "/booking")
public class MainBookingServlet extends HttpServlet {

    // 1. doGet do przesłania rządania wyświetlenia strony, do JSP odpowiedzialnego za widok strony
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // XYZ będzie wywoływał z DB info o ilości i stanie (wolności) miejsc
        //req.setAttribute("view_audience", XYZ);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/view-audience.jsp");

        dispatcher.forward(req, resp);
    }
}
