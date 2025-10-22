package controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import dao.DBConnection;

public class ViewBookingsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT b.id, m.title, b.seats, b.total_price, b.booking_date FROM bookings b JOIN movies m ON b.movie_id = m.id");
            ResultSet rs = ps.executeQuery();

            request.setAttribute("result", rs);
            RequestDispatcher rd = request.getRequestDispatcher("viewBookings.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

