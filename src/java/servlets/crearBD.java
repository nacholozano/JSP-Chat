package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utiles.*;

public class crearBD extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            BD conexion = new BD();
            conexion.conectar("root", "usuario", "jdbc:mysql://localhost/");
            Statement stmt = conexion.getConn().createStatement();
      
            String sql = "CREATE DATABASE Chat "
                    + "DEFAULT CHARACTER SET latin1 "
                    + "DEFAULT COLLATE latin1_spanish_ci";
            stmt.executeUpdate(sql);
            out.println("Database Chat created successfully...");

            conexion.desconectar();
            
            conexion.conectar("root", "usuario", "jdbc:mysql://localhost/Chat");
            stmt = conexion.getConn().createStatement();
            
            out.println("Using database Chat...");
            
            sql = "CREATE TABLE Usuarios " +
                   "( nick VARCHAR(50) primary key," + 
                   " pass VARCHAR(70) )";

            stmt.executeUpdate(sql);
            out.println("Created table Usuarios...");
            
            sql = "INSERT INTO Usuarios(nick,pass) "
                    + "VALUES ('root','root')";
            
            stmt.executeUpdate(sql);
            out.println("Insert Admin succesfully...");
            
            sql = "CREATE TABLE Mensajes " +
                   "( mensaje VARCHAR(300) ," + 
                   " nick VARCHAR(50)," + 
                   " fecha DATETIME,"+
                   " id int PRIMARY KEY AUTO_INCREMENT)";

            stmt.executeUpdate(sql);
            out.println("Created table Mensajes...");
            
            conexion.desconectar();
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(crearBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(crearBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
