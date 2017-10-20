/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package biblioteca.ofelia.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import biblioteca.ofelia.entidad.rol;
import biblioteca.ofelia.procesos.n_rol;
import biblioteca.ofelia.util.*;
/**
 *
 * @author Karol
 */
@WebServlet(name = "ControlRol", urlPatterns = {"/ControlRol"})
public class ControlRol extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            
            String rol=(String)request.getParameter("rol");
            String idrol=(String)request.getParameter("idrol");
            String op=(String)request.getParameter("op");
            
            rol r = new rol();
            n_rol nr = new n_rol();
            
            if(op.equals("add_Rol")){
                
                r.setRol(rol.toUpperCase());
                
                nr.setR(r);
                nr.IngresarRol();
                
                if(nr.val==1)
                {
                    response.sendRedirect("Rol.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Rol.jsp?mensaje=2");
                }
             }
            
            
            if(op.equals("delete_Rol")){
                r.setIdrol(idrol);
                nr.setR(r);
                nr.EliminarRol();
                if(nr.val==1)
                {
                    response.sendRedirect("Rol.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Rol.jsp?mensaje=4");
                }
            }
            
            
            if(op.equals("update_Rol")){

                r.setRol(rol.toUpperCase());
                r.setIdrol(idrol);
                
                nr.setR(r);
                nr.ActualizarRol();
                
                if(nr.val==1)
                {
                    response.sendRedirect("Rol.jsp?mensaje=5");
                }else{
                    response.sendRedirect("Rol.jsp?mensaje=6");
                }
                
                
            }
            
            
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
