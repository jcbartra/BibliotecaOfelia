/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biblioteca.ofelia.entidad.ejemplar;
import biblioteca.ofelia.procesos.n_ejemplar;

public class ControlEjemplar extends HttpServlet {

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
            
            String idlibro = (String)request.getParameter("idlibro");
            int cant_ejemplar = Integer.parseInt((String)request.getParameter("cant_ejemplar"));
            String op = (String) request.getParameter("op");
            
            String con="";
                    
            
            ejemplar ej = new ejemplar();
            n_ejemplar nej = new n_ejemplar();
            
            if (op.equals("add_ejemplar")) {
                for(int k=0; k<cant_ejemplar; k++){
                    con=con+"insert into ejemplar (idlibro,idproveedor,estado_libro,fecha_ingreso,estado_prestamo, estado) "
                            + "values ('"+idlibro+"','0001','B',to_char(sysdate,'DD/MM/YYYY'),'0','1'); ";
                }
                nej.setE(ej);
                nej.Ingresar_Ejemplar(con);
                
                if(nej.val==1)
                {
                    response.sendRedirect("Ejemplar.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Ejemplar.jsp?mensaje=2");
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
