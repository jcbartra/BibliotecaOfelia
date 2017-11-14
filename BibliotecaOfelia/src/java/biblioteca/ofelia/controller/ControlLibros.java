/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.controller;

import biblioteca.ofelia.entidad.libro;
import biblioteca.ofelia.procesos.n_libros;
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
@WebServlet(name = "ControlLibros", urlPatterns = {"/ControlLibros"})
public class ControlLibros extends HttpServlet {

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
            

            String idsubcategoria = (String)request.getParameter("idsubcategoria");
            String subcategoria = (String)request.getParameter("subcategoria");
            String ideditorial = (String)request.getParameter("ideditorial");
            String titulo = (String) request.getParameter("titulo");
            String idautor = (String)request.getParameter("idautor");
            String anio_publicacion = (String)request.getParameter("anio_publicacion");
            String paginas = (String)request.getParameter("paginas");
            String idlibro = (String)request.getParameter("idlibro");
            String op = (String) request.getParameter("op");

            libro lb = new libro();
            n_libros lib = new n_libros();

            if (op.equals("add_Libro")) {

                lb.setIdsubcategoria(idsubcategoria);
                lb.setIdeditorial(ideditorial);
                lb.setTitulo(titulo.toUpperCase());
                lb.setIdautor(idautor);
                lb.setAnio_publicacion(anio_publicacion);
                lb.setPaginas(paginas);
                
                lib.setL(lb);
                lib.IngresarLibro();

                if (lib.val == 1) {
                    response.sendRedirect("Libro.jsp?mensaje=1");
                } else {
                    response.sendRedirect("Libro.jsp?mensaje=2");
                }

            }
            if(op.equals("delete_Libro")){
                lb.setIdlibro(idlibro);
                
                lib.setL(lb);
                lib.BorrarLibro();
                if(lib.val==1)
                {
                    response.sendRedirect("Libro.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Libro.jsp?mensaje=4");
                }
            }
            
            if(op.equals("update_Libro")){
                
                lb.setIdsubcategoria(idsubcategoria);
                lb.setIdeditorial(ideditorial);
                lb.setTitulo(titulo.toUpperCase());
                lb.setIdautor(idautor);
                lb.setAnio_publicacion(anio_publicacion);
                lb.setPaginas(paginas);
                lb.setIdlibro(idlibro);
                
                lib.setL(lb);
                lib.ActualizarLibro();
                
                if(lib.val==1)
                {
                    response.sendRedirect("Libro.jsp?mensaje=5");
                }else{
                    response.sendRedirect("Libro.jsp?mensaje=6");
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
