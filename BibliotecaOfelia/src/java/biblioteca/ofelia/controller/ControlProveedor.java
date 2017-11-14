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


import biblioteca.ofelia.entidad.proveedor;
import biblioteca.ofelia.procesos.n_proveedor;
import biblioteca.ofelia.util.*;

/**
 *
 * @author Karol
 */
@WebServlet(name = "ControlProveedor", urlPatterns = {"/ControlProveedor"})
public class ControlProveedor extends HttpServlet {

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
            
            String proveedor=(String)request.getParameter("proveedor");
            String idproveedor=(String)request.getParameter("idproveedor");
            String op=(String)request.getParameter("op");
            
            proveedor p = new proveedor();
            n_proveedor np = new n_proveedor();
            
            
            if(op.equals("add_Proveedor")){
                
                p.setProveedor(proveedor.toUpperCase());
                
                np.setP(p);
                np.IngresarProveedor();
                
                if(np.val==1)
                {
                    response.sendRedirect("Proveedor.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Proveedor.jsp?mensaje=2");
                }
             }
            
            if(op.equals("delete_Proveedor")){
                p.setIdproveedor(idproveedor);
                np.setP(p);
                np.EliminarProveedor();
                if(np.val==1)
                {
                    response.sendRedirect("Proveedor.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Proveedor.jsp?mensaje=4");
                }
            }
            
            
            if(op.equals("update_Proveedor")){

                p.setProveedor(proveedor.toUpperCase());
                p.setIdproveedor(idproveedor);
                
                np.setP(p);
                np.ActualizarProveedor();
                
                if(np.val==1)
                {
                    response.sendRedirect("Proveedor.jsp?mensaje=5");
                }else{
                    response.sendRedirect("Proveedor.jsp?mensaje=6");
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
