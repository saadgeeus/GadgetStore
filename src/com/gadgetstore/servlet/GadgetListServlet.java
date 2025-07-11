package com.gadgetstore.servlet;

import com.gadgetstore.model.Gadget;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class GadgetListServlet extends HttpServlet {
    private static List<Gadget> gadgets = new ArrayList<>();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("gadgetList", gadgets);
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        gadgets.add(new Gadget(name, price));
        response.sendRedirect("gadgets");
    }
}
