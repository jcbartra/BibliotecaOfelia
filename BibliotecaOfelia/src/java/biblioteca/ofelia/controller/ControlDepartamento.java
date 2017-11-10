/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.controller;

import biblioteca.ofelia.entidad.departamento;
import biblioteca.ofelia.procesos.n_departamento;
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
@WebServlet(name = "ControlDepartamento", urlPatterns = {"/ControlDepartamento"})
public class ControlDepartamento extends HttpServlet {

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
            String iddepartamento=(String)request.getParameter("iddepartamento");
            String nombre=(String)request.getParameter("nombre");
            String cod=(String)request.getParameter("cod");
            String idpais=(String)request.getParameter("idpais");
            String op=(String)request.getParameter("op");
            
            departamento d= new departamento();
            n_departamento nd =new n_departamento();
            
            if(op.equals("add_Departamento")){
                
                d.setNombre(nombre);
                d.setCod(cod);
                d.setIdpais(idpais);                
                nd.setDep(d);
                nd.IngresarDepartamento();
                
                if(nd.val==1)
                {
                    response.sendRedirect("Ubigeo.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Ubigeo.jsp?mensaje=2");
                }
                
                
            }
            
            if(op.equals("delete_Departamento")){
                d.setIddepartamento(iddepartamento);
                nd.setDep(d);
                nd.Buscar_departamento();
                if(nd.val==1)
                {
                    response.sendRedirect("Ubigeo.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Ubigeo.jsp?mensaje=4");
                }
            }
            
            if(op.equals("update_Departamento")){
                
                d.setIddepartamento(iddepartamento);
                d.setNombre(nombre);
                d.setCod(cod);
                d.setIdpais(idpais);
                
                nd.setDep(d);
                nd.ActualizarDepartamento();
                
                if(nd.val==1)
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
