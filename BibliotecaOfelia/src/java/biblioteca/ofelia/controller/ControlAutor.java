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
            String estado = (String) request.getParameter("estado");
            String idAutor = (String) request.getParameter("idautor");
            String op = (String) request.getParameter("op");

            autor a = new autor();
            n_autores na = new n_autores();

            if (op.equals("add_Autor")) {

                a.setIdAutor(idAutor);
                a.setNombre(nombre.toUpperCase());
                a.setEstado(estado);

                na.setA(a);
                na.IngresarAutor();

                if (na.val == 1) {
                    response.sendRedirect("Autor.jsp?mensaje=1");
                } else {
                    response.sendRedirect("Autor.jsp?mensaje=2");
                }
            }
        }
    }
}
