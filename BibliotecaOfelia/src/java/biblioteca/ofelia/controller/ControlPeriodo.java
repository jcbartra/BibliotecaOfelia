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


import biblioteca.ofelia.entidad.periodo;
import biblioteca.ofelia.procesos.n_periodo;
import biblioteca.ofelia.util.*;

/**
 *
 * @author Karol
 */
@WebServlet(name = "ControlPeriodo", urlPatterns = {"/ControlPeriodo"})
public class ControlPeriodo extends HttpServlet {

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
            
            String periodo=(String)request.getParameter("periodo");
            String idperiodo=(String)request.getParameter("idperiodo");
            String op=(String)request.getParameter("op");
            
            periodo p = new periodo();
            n_periodo np = new n_periodo();
            
            if(op.equals("add_Periodo")){
                
                p.setPeriodo(periodo.toUpperCase());
                
                np.setP(p);
                np.IngresarPeriodo();
                
                if(np.val==1)
                {
                    response.sendRedirect("Periodo.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Periodo.jsp?mensaje=2");
                }
             }
            
            if(op.equals("delete_Periodo")){
                p.setIdperiodo(idperiodo);
                np.setP(p);
                np.EliminarPeriodo();
                if(np.val==1)
                {
                    response.sendRedirect("Periodo.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Periodo.jsp?mensaje=4");
                }
            }
            
            
            if(op.equals("update_Periodo")){

                p.setPeriodo(periodo.toUpperCase());
                p.setIdperiodo(idperiodo);
                
                np.setP(p);
                np.ActualizarPeriodo();
                
                if(np.val==1)
                {
                    response.sendRedirect("Periodo.jsp?mensaje=5");
                }else{
                    response.sendRedirect("Periodo.jsp?mensaje=6");
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
