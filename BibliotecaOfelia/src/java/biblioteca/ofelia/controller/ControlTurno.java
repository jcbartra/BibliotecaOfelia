/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.controller;

import biblioteca.ofelia.entidad.turno;
import biblioteca.ofelia.procesos.n_turnos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GADEA-JADE
 */
public class ControlTurno extends HttpServlet {

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

            String turno = (String) request.getParameter("turno");
            String idturno = (String) request.getParameter("idturno");
            String op = (String) request.getParameter("op");

            turno tu = new turno();
            n_turnos ntu = new n_turnos();

            if (op.equals("add_Turno")) {
                tu.setTurno(turno.toUpperCase());
                ntu.setT(tu);
                ntu.IngresarTurno();

                if (ntu.val == 1) {
                    response.sendRedirect("Turno.jsp?mensaje=1");
                } else {
                    response.sendRedirect("Turno.jsp?mensaje=2");
                }
            }
            
            if(op.equals("delete_Turno")){
                tu.setIdturno(idturno);
                ntu.setT(tu);
                ntu.BorrarTurno();
                if(ntu.val==1)
                {
                    response.sendRedirect("Turno.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Turno.jsp?mensaje=4");
                }
            }
            
            if(op.equals("update_Turno")){
                
                tu.setTurno(turno.toUpperCase());
                tu.setIdturno(idturno);

                ntu.setT(tu);
                ntu.ActualizarTurno();
                
                if(ntu.val==1)
                {
                    response.sendRedirect("Turno.jsp?mensaje=5");
                }else{
                    response.sendRedirect("Turno.jsp?mensaje=6");
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
