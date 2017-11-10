/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.controller;

import biblioteca.ofelia.entidad.usuario;
import biblioteca.ofelia.procesos.n_usuario;
import biblioteca.ofelia.util.*;
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
@WebServlet(name = "ControlUsuario", urlPatterns = {"/ControlUsuario"})
public class ControlUsuario extends HttpServlet {

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
            
            STRCrypto desEncrypter = new STRCrypto("ndprVF14Jp8=");
            
            String idrol = (String) request.getParameter("rol");
            String idpersona = (String) request.getParameter("persona");
            String usuario = (String) request.getParameter("usuario");
            String clave = (String) request.getParameter("clave");if(clave==null){clave="n";}
            String ops = (String) request.getParameter("ops");
            String ids = (String) request.getParameter("ids");
            
            String clave_encrypt=desEncrypter.encrypt(clave);
            
            usuario us=new usuario();
            n_usuario nus =new n_usuario();
            
            if (ops.equals("add_usuario")) {

                us.setIdrol(idrol);
                us.setIdpersona(idpersona.toUpperCase());
                us.setUsuario(usuario);
                us.setClave(clave_encrypt);

                nus.setUs(us);
                nus.InsertarUsuario();
                    if(nus.val==1)
                {
                    response.sendRedirect("Usuario.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Usuario.jsp?mensaje=2");
                }
                
            }
            
            if (ops.equals("eliminar")) {
                us.setIdusuario(ids);
                nus.setUs(us);
                nus.EliminarUsuario();
                if(nus.val==1)
                {
                    response.sendRedirect("Usuario.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Usuario.jsp?mensaje=4");
                }
            }
            
            
            if (ops.equals("update_usuario")) {
                
                us.setIdrol(idrol);
                us.setIdpersona(idpersona.toUpperCase());
                us.setUsuario(usuario);
                us.setClave(clave_encrypt);
                us.setIdusuario(ids);
               

                nus.setUs(us);

                nus.actualizarUser();

                if(nus.val==1)
                {
                    response.sendRedirect("Usuario.jsp?mensaje=5");
                }else{
                    response.sendRedirect("Usuario.jsp?mensaje=6");
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
