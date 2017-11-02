/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.controller;

import biblioteca.ofelia.entidad.pais;
import biblioteca.ofelia.procesos.n_pais;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SORALUZ
 */
@WebServlet(name = "ControlPais", urlPatterns = {"/ControlPais"})
public class ControlPais extends HttpServlet {

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
            String idpais=(String)request.getParameter("idpais");
            String nombre=(String)request.getParameter("nombre");
            String cod=(String)request.getParameter("cod");
            String estado=(String)request.getParameter("estado");
            String op=(String)request.getParameter("op");
            
            pais p= new pais();
            n_pais pa =new n_pais();
            
            if(op.equals("add_Pais")){
                
                p.setNombre(nombre);
                p.setCod(cod);
                p.setEstado(estado);                
                pa.setPa(p);
                pa.IngresarPais();
                
                if(pa.val==1)
                {
                    response.sendRedirect("Pais.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Pais.jsp?mensaje=2");
                }
                
                
            }
            
            if(op.equals("delete_Pais")){
                p.setIdpais(idpais);
                pa.setPa(p);
                pa.BorrarPais();
                if(pa.val==1)
                {
                    response.sendRedirect("Pais.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Pais.jsp?mensaje=4");
                }
            }
            
            if(op.equals("update_Pais")){
                
                p.setIdpais(idpais);
                p.setNombre(nombre);
                p.setCod(cod);
                p.setEstado(estado);                
                pa.setPa(p);
                pa.actualizarPais();
                
                
                if(pa.val==1)
                {
                    response.sendRedirect("Pais.jsp?mensaje=5");
                }else{
                    response.sendRedirect("Pais.jsp?mensaje=6");
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
