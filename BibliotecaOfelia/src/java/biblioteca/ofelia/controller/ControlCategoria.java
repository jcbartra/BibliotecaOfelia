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

import biblioteca.ofelia.entidad.categoria;
import biblioteca.ofelia.procesos.n_categoria;
import biblioteca.ofelia.util.*;

@WebServlet(name = "ControlCategoria", urlPatterns = {"/ControlCategoria"})
public class ControlCategoria extends HttpServlet {

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
            
            String nro=(String)request.getParameter("nro");
            String nombre=(String)request.getParameter("nombre");
            String descripcion=(String)request.getParameter("descripcion");
            String colores=(String)request.getParameter("colores");
            String iconos=(String)request.getParameter("iconos");
            String idcategoria=(String)request.getParameter("idcategoria");
            String op=(String)request.getParameter("op");
            
            categoria c= new categoria();
            n_categoria nc =new n_categoria();
            
            if(op.equals("add_Categoria")){
                
                c.setNroini(nro);
                c.setNombre(nombre.toUpperCase());
                c.setDescripcion(descripcion.toUpperCase());
                c.setColor(colores.toLowerCase());
                c.setIcono(iconos.toLowerCase());
                
                nc.setC(c);
                nc.IngresarCategoria();
                
                if(nc.val==1)
                {
                    response.sendRedirect("Categoria.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Categoria.jsp?mensaje=2");
                }
                
                
            }
            
            if(op.equals("delete_Categoria")){
                c.setIdcategoria(idcategoria);
                nc.setC(c);
                nc.BorrarCategoria();
                if(nc.val==1)
                {
                    response.sendRedirect("Categoria.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Categoria.jsp?mensaje=4");
                }
            }
            
            if(op.equals("update_Categoria")){
                
                c.setNroini(nro);
                c.setNombre(nombre.toUpperCase());
                c.setDescripcion(descripcion.toUpperCase());
                c.setColor(colores.toLowerCase());
                c.setIcono(iconos.toLowerCase());
                c.setIdcategoria(idcategoria);
                
                nc.setC(c);
                nc.ActualizarCategoria();
                
                if(nc.val==1)
                {
                    response.sendRedirect("Categoria.jsp?mensaje=5");
                }else{
                    response.sendRedirect("Categoria.jsp?mensaje=6");
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
