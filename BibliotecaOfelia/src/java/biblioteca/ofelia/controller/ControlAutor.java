package biblioteca.ofelia.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GADEA-JADE
 */
import biblioteca.ofelia.entidad.autor;
import biblioteca.ofelia.procesos.n_autores;
import biblioteca.ofelia.util.*;

@WebServlet(name = "ControlAutor", urlPatterns = {"/ControlAutor"})
public class ControlAutor extends HttpServlet {

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

            String nombre = (String) request.getParameter("nombre");
            String idautor = (String) request.getParameter("idautor");
            String op = (String) request.getParameter("op");

            autor a = new autor();
            n_autores na = new n_autores();

            if (op.equals("add_Autor")) {
                a.setNombre(nombre.toUpperCase());
                na.setA(a);
                na.IngresarAutor();

                if (na.val == 1) {
                    response.sendRedirect("Autor.jsp?mensaje=1");
                } else {
                    response.sendRedirect("Autor.jsp?mensaje=2");
                }
            }
            
            if(op.equals("delete_Autor")){
                a.setIdautor(idautor);
                na.setA(a);
                na.BorrarAutor();
                if(na.val==1)
                {
                    response.sendRedirect("Autor.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Autor.jsp?mensaje=4");
                }
            }
            
            if(op.equals("update_Autor")){
                
                a.setNombre(nombre.toUpperCase());

                a.setIdautor(idautor);
                na.setA(a);
                na.ActualizarAutor();
                
                if(na.val==1)
                {
                    response.sendRedirect("Autor.jsp?mensaje=5");
                }else{
                    response.sendRedirect("Autor.jsp?mensaje=6");
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
    