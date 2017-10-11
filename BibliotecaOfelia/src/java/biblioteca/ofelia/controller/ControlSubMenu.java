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


import biblioteca.ofelia.entidad.submenu;
import biblioteca.ofelia.procesos.n_submenu;
import biblioteca.ofelia.util.*;
/**
 *
 * @author JcBartra
 */
@WebServlet(name = "ControlSubMenu", urlPatterns = {"/ControlSubMenu"})
public class ControlSubMenu extends HttpServlet {

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
            
            String nombre=(String)request.getParameter("nombre");
            String link=(String)request.getParameter("link");
            String iconos=(String)request.getParameter("iconos");
            String idmenu=(String)request.getParameter("idmenu");
            String idsubmenu=(String)request.getParameter("idsubmenu");
            String op=(String)request.getParameter("op");
            
            submenu sm=new submenu();
            n_submenu nsm= new n_submenu();
            
            if(op.equals("add_SubMenu")){
                
                sm.setNombre(nombre);
                sm.setLink(link);
                sm.setIcono(iconos.toLowerCase());
                sm.setIdmenu(idmenu);
                
                nsm.setSm(sm);
                nsm.IngresarSubMenu();
                
                if(nsm.val==1)
                {
                    response.sendRedirect("Menu.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Menu.jsp?mensaje=2");
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
