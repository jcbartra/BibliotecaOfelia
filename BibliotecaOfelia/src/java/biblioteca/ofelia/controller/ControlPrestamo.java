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

import biblioteca.ofelia.entidad.prest_detalle;
import biblioteca.ofelia.procesos.n_prest_detalle;
import biblioteca.ofelia.util.*;

@WebServlet(name = "ControlPrestamo", urlPatterns = {"/ControlPrestamo"})
public class ControlPrestamo extends HttpServlet {

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
            String idejemplar=(String)request.getParameter("idejemplar");
            String idlector=(String)request.getParameter("idpersona");
            String idusuario=(String)request.getParameter("idusuario");
            String idprestamo=(String)request.getParameter("idprestamo");
            String fecha_entrega=(String)request.getParameter("fecha_entrega");if(fecha_entrega==null){fecha_entrega="0000-00-00";}
            String hora_entrega=(String)request.getParameter("hora_entrega");
            String minuto_entrega=(String)request.getParameter("minuto_entrega");
            String detalle_devolucion=(String)request.getParameter("detalle_devolucion");
            String op=(String)request.getParameter("op");
            
            String f_entrega=fecha_entrega.substring(8,10)+"/"+fecha_entrega.substring(5,7)+"/"+fecha_entrega.substring(0,4);
            
            prest_detalle pd=new prest_detalle();
            n_prest_detalle npd=new n_prest_detalle();
            out.println("--------------------------------------"+op);
            if(op.equals("add_prestamo")){
                pd.setIdejemplar(idejemplar);
                pd.setIdlector(idlector);
                pd.setIdusuario(idusuario);
                pd.setFech_dev(f_entrega);
                pd.setHora_dev(hora_entrega+":"+minuto_entrega);
                npd.setPd(pd);
                npd.IngresarPrestamo();
                if(npd.val==1)
                {
                    response.sendRedirect("Prestamo.jsp?mensaje=1");
                }else{
                    response.sendRedirect("Prestamo.jsp?mensaje=2");
                }
            }
            
            if(op.equals("entrega_prestamo")){
                out.println("--------------------------------------");
                pd.setIdejemplar(idejemplar);
                pd.setIdprestamo(idprestamo);
                pd.setDevuelta(detalle_devolucion);
                npd.setPd(pd);
                npd.DevolverLibro();
                if(npd.val==1)
                {
                    response.sendRedirect("Prestamo.jsp?mensaje=3");
                }else{
                    response.sendRedirect("Prestamo.jsp?mensaje=4");
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
