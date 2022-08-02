/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author harshangprajapati
 */
@MultipartConfig
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //getting all the incoming detail from the request.....
            
            String name = request.getParameter("user_name");
            String password = request.getParameter("user_password");
            String email = request.getParameter("user_email");
            Part part = request.getPart("image");
            
//            out.println(part);
            
            String filename = part.getSubmittedFileName();
            
//            out.println(filename);
            // Connection.........................

            try{
                
                Thread.sleep(3000);
                
                Class.forName("com.mysql.jdbc.Driver"); 
                
                Connection connection = 
                        DriverManager
                                .getConnection("jdbc:mysql://localhost:3306/register","root","Rydot123.?");
                
                String q = "insert into user(name,password,email,imagename) values(?,?,?,?)";
                
                PreparedStatement preparedStatement = connection.prepareStatement(q);
                
                preparedStatement.setString(1,name);
                preparedStatement.setString(2,password);
                preparedStatement.setString(3,email);
                preparedStatement.setString(4,filename);
                
                preparedStatement.executeUpdate(); 
                
                InputStream inputStream = part.getInputStream();
                byte[] data = new byte[inputStream.available()];
                
                inputStream.read(data);
                
                String path = request.getRealPath("/") + "img" + File.separator + filename;
                
//                out.println(path);
                
                FileOutputStream fileOutputStream = new FileOutputStream(path);
                
                fileOutputStream.write(data);
                fileOutputStream.close();
                
                out.println("done");
                
                
            } catch (Exception ex) {
                ex.printStackTrace();
                out.println("Error");
            }
            
            
            // query..............................
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
        processRequest(request, response);
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
        processRequest(request, response);
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
