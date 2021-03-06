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
import biblioteca.ofelia.entidad.ubigeo;
import biblioteca.ofelia.procesos.n_ubigeo;
import biblioteca.ofelia.util.*;
/**
 *
 * @author SORALUZ
 */
@WebServlet(name = "ControlUbigeo", urlPatterns = {"/ControlUbigeo"})
public class ControlUbigeo extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            
            String idubigeo=(String)request.getParameter("idubigeo");
            String nombre=(String)request.getParameter("nombre");
            String cod=(String)request.getParameter("cod");
            String iddepartamento=(String)request.getParameter("iddepartamento");
            String idpais=(String)request.getParameter("idpais");
            String estado=(String)request.getParameter("estado");
            String id=(String)request.getParameter("id");
            
            String op=(String)request.getParameter("op");
            
            ubigeo ub= new ubigeo();
            n_ubigeo nu =new n_ubigeo();
            
            if(op.equals("insertUbigeo")){                
                ub.setIddepartamento(iddepartamento); 
                ub.setNombre(nombre);
                ub.setCod(cod);
                               
                nu.setUb(ub);
                nu.IngresarUbigeo();
                
                if(nu.val==1)
                {
                    response.sendRedirect("Ubigeo.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Ubigeo.jsp?mensaje=2");
                }
                
                
            }
            
            if(op.equals("delete_Ubigeo")){
                ub.setIdubigeo(idubigeo);
                nu.setUb(ub);
                nu.BorrarUbigeo();
                if(nu.val==1)
                {
                    response.sendRedirect("Ubigeo.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Ubigeo.jsp?mensaje=4");
                }
            }
            
            if(op.equals("update_Ubigeo")){
                
                
                ub.setNombre(nombre);
                ub.setCod(cod);
                ub.setIddepartamento(iddepartamento);
                ub.setIdubigeo(id);  
                
                nu.setUb(ub);
                nu.actualizar();
                
                
                if(nu.val==1)
                {
                    response.sendRedirect("Ubigeo.jsp?mensaje=5");
                }else{
                    response.sendRedirect("Ubigeo.jsp?mensaje=6");
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
