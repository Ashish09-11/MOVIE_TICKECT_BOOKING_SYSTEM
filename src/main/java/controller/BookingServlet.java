package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("user_id"));
        int movieId = Integer.parseInt(request.getParameter("movie_id"));
        String theater = request.getParameter("theater_name");
        String seats = request.getParameter("seats");
        double totalPrice = Double.parseDouble(request.getParameter("total_price"));
        String bookingDate = request.getParameter("booking_date");
        String showTime = request.getParameter("show_time");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cinema_db", "root", "Ritesh@2005");

            String sql = "INSERT INTO booking (user_id, movie_id, theater_name, seats, total_price, booking_date, show_time, payment_status) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, 'Pending')";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, movieId);
            ps.setString(3, theater);
            ps.setString(4, seats);
            ps.setDouble(5, totalPrice);
            ps.setString(6, bookingDate);
            ps.setString(7, showTime);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("payment.jsp?success=true");
            } else {
                response.sendRedirect("booking.jsp?error=insert_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception ex) {}
            try { if (conn != null) conn.close(); } catch (Exception ex) {}
        }
    }
}
