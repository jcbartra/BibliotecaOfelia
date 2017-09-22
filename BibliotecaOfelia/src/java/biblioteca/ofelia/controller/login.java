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

import biblioteca.ofelia.entidad.usuario;
import biblioteca.ofelia.procesos.n_login;
import biblioteca.ofelia.util.*;

/**
 *
 * @author JcBartra
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
            
            String usuario=(String)request.getParameter("user");
            String clave=(String)request.getParameter("pass");
            
            String clave_encryp=desEncrypter.encrypt(clave);
            
            usuario us=new usuario();
            n_login nl=new n_login();
            
            nl.setUs(us);
            
            us.setUsuario(usuario);
            us.setClave(clave_encryp);
            
            nl.Buscar_usuario();
            
            if(nl.val==1)
            {
                //response.sendRedirect("reporte.jsp?mensaje=1");
                out.println("El usuario es correcto pero no la contraseña");
            }else if(nl.val==2)
            {
                //response.sendRedirect("reporte.jsp?mensaje=1");
                out.println("El usuario y la contraseña son correctos");
            }else
            {
                //response.sendRedirect("reporte.jsp?mensaje=1");
                out.println("ni El usuario ni la contraseña son correctos");
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
