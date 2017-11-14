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

import biblioteca.ofelia.entidad.editorial;
import biblioteca.ofelia.procesos.n_editorial;

/**
 *
 * @author GADEA-JADE
 */
@WebServlet(name = "ControlEditorial", urlPatterns = {"/ControlEditorial"})
public class ControlEditorial extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String idubigeo = (String)request.getParameter("idubigeo");
            String nombre = (String) request.getParameter("nombre");
            String ideditorial = (String)request.getParameter("ideditorial");
            String op = (String) request.getParameter("op");

            editorial edi = new editorial();
            n_editorial ed = new n_editorial();

            if (op.equals("add_Editorial")) {

                edi.setIdubigeo(idubigeo);
                edi.setNombre(nombre.toUpperCase());

                ed.setE(edi);
                ed.IngresarEditorial();

                if (ed.val == 1) {
                    response.sendRedirect("Editorial.jsp?mensaje=1");
                } else {
                    response.sendRedirect("Editorial.jsp?mensaje=2");
                }

            }
            if(op.equals("delete_Editorial")){
                edi.setIdeditorial(ideditorial);
                ed.setE(edi);
                ed.BorrarEditorial();
                if(ed.val==1)
                {
                    response.sendRedirect("Editorial.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Editorial.jsp?mensaje=4");
                }
            }
            
            if(op.equals("update_Editorial")){
                
                edi.setIdubigeo(idubigeo);
                edi.setNombre(nombre.toUpperCase());
                edi.setIdeditorial(ideditorial);
                
                ed.setE(edi);
                ed.ActualizarEditorial();
                
                if(ed.val==1)
                {
                    response.sendRedirect("Editorial.jsp?mensaje=5");
                }else{
                    response.sendRedirect("Editorial.jsp?mensaje=6");
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
 