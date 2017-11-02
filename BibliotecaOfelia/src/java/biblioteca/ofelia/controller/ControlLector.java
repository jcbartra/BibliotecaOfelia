/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.controller;

import biblioteca.ofelia.entidad.lector;
import biblioteca.ofelia.procesos.n_lector;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControlLector", urlPatterns = {"/ControlLector"})
public class ControlLector extends HttpServlet {

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
            String idpersona = (String) request.getParameter("idpersona");
            String idtipo = (String) request.getParameter("idtipo");
            String idturno = (String) request.getParameter("idturno");
            String idperiodo = (String) request.getParameter("idperiodo");
            String estado_habil = (String) request.getParameter("estado_habil");
            String nivel = (String) request.getParameter("nivel");
            String grado = (String) request.getParameter("grado");
            String seccion = (String) request.getParameter("seccion");
            String condicion = (String) request.getParameter("condicion");
            String estado_periodo = (String) request.getParameter("estado_periodo");
            String estado = (String) request.getParameter("estado");
            String id = (String) request.getParameter("id");
            String op = (String) request.getParameter("op");

            lector l = new lector();
            n_lector nl = new n_lector();

            if (op.equals("ingresar_persona")) {

                l.setIdpersona(idpersona);
                l.setIdtipo(idtipo);
                l.setIdturno(idturno);
                l.setIdperiodo(idperiodo);
                l.setEstado_habil(estado_habil);
                l.setNivel(nivel);
                l.setGrado(grado);
                l.setSeccion(seccion);
                l.setCondicion(condicion);
                l.setEstado_periodo(estado_periodo);
                l.setEstado(estado);

                nl.setL(l);
                nl.IngresarLector();
                if (nl.val == 1) {
                    response.sendRedirect("Persona.jsp?mensaje=1");
                } else {
                    response.sendRedirect("Persona.jsp?mensaje=2");
                }

            }

            if (op.equals("eliminar")) {
                l.setIdlector(id);
                nl.setL(l);
                nl.Eliminar();
                if (nl.val == 1) {
                    response.sendRedirect("Persona.jsp?mensaje=1");
                } else {
                    response.sendRedirect("Persona.jsp?mensaje=2");
                }
            }

            if (op.equals("update")) {

                l.setIdpersona(idpersona);
                l.setIdtipo(idtipo);
                l.setIdturno(idturno);
                l.setIdperiodo(idperiodo);
                l.setEstado_habil(estado_habil);
                l.setNivel(nivel);
                l.setGrado(grado);
                l.setSeccion(seccion);
                l.setCondicion(condicion);
                l.setEstado_periodo(estado_periodo);
            //    l.setEstado(estado);
                l.setIdlector(id);

                nl.setL(l);

            //    nl.actualizar();

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
