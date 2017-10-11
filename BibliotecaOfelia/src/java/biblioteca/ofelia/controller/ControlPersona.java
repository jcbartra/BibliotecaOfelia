/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.controller;

import biblioteca.ofelia.entidad.persona;
import biblioteca.ofelia.procesos.n_persona;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alex Maluquish
 */
@WebServlet(name = "ControlPersona", urlPatterns = {"/ControlPersona"})
public class ControlPersona extends HttpServlet {

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
            String idtipodoc = (String) request.getParameter("idtipodoc");
            String idubigeo = (String) request.getParameter("idubigeo");
            String nombres = (String) request.getParameter("nombres");
            String ape_paterno = (String) request.getParameter("ape_paterno");
            String ape_materno = (String) request.getParameter("ape_materno");
            String genero = (String) request.getParameter("genero");
            String fecha_nacimiento = (String) request.getParameter("fecha_nacimiento");
            String nro_doc = (String) request.getParameter("nro_doc");
            String direccion = (String) request.getParameter("direccion");
            String telefono = (String) request.getParameter("telefono");
            String foto = (String) request.getParameter("foto");
            String op = (String) request.getParameter("op");
            String id = (String) request.getParameter("id");

            persona p = new persona();
            n_persona np = new n_persona();
            System.out.println(op);

            if (op.equals("add_Persona")) {

                p.setIdtipodoc(idtipodoc);
                p.setIdubigeo(idubigeo);
                p.setNombres(nombres);
                p.setApe_paterno(ape_paterno);
                p.setApe_materno(ape_materno);
                p.setGenero(genero);
                p.setFecha_nacimiento(fecha_nacimiento);
                p.setNro_doc(nro_doc);
                p.setDireccion(direccion);
                p.setTelefono(telefono);
                p.setFoto(foto);

                np.setP(p);
                np.InsertarPersona();
                    if(np.val==1)
                {
                    response.sendRedirect("Persona.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Persona.jsp?mensaje=2");
                }
                
            }

            if (op.equals("eliminar")) {
                p.setIdpersona(id);
                np.setP(p);
                np.Eliminar();
                if(np.val==1)
                {
                    response.sendRedirect("Persona.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Persona.jsp?mensaje=2");
                }
            }

            if (op.equals("update")) {
                
                p.setIdtipodoc(idtipodoc);
                p.setIdubigeo(idubigeo);
                p.setNombres(nombres);
                p.setApe_paterno(ape_paterno);
                p.setApe_materno(ape_materno);
                p.setGenero(genero);
                p.setFecha_nacimiento(fecha_nacimiento);
                p.setNro_doc(nro_doc);
                p.setDireccion(direccion);
                p.setTelefono(telefono);
                p.setIdpersona(id);

                np.setP(p);

                np.actualizar();

                
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
