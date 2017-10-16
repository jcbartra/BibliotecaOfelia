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

import biblioteca.ofelia.entidad.accesos;
import biblioteca.ofelia.procesos.n_accesos;
import biblioteca.ofelia.util.*;

@WebServlet(name = "ControlAccesos", urlPatterns = {"/ControlAccesos"})
public class ControlAccesos extends HttpServlet {

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
            
            String idmenu="";
            String idsubmenu="";
            String idrol=(String) request.getParameter("idrol");
            String seleccion="";
            int pru=0;
            String men="";
            int tmenu=Integer.parseInt((String)request.getParameter("tmenu"));
            
            accesos ac=new accesos();
            n_accesos nac=new n_accesos();
            
            
            for (int i = 1; i <= tmenu; i++) {
                if(!men.equals(idmenu)&&pru==1){pru=0;}
                out.println(idmenu+"---"+pru);
                idmenu=(String) request.getParameter("idmenu"+idrol+i);
                idsubmenu=(String) request.getParameter("idsubmenu"+idrol+i);
                seleccion=(String) request.getParameter("seleccion"+idrol+i);if(seleccion==null){seleccion="N";}
                //out.println("*menu -"+idmenu+" *submenu -"+idsubmenu+" *rol -"+idrol+" *selección -"+seleccion+"<br/>");
                //si se va a ingresar los menues
                if(seleccion.equals("S")&&pru==0)
                {
                   /* ac.setIdmenu(idmenu);
                    ac.setIdrol(idrol);
                    nac.setAc(ac);
                    nac.ActualizarAccesos();*/
                }
                //si se va a eliminar los menues
                if(!men.equals(idmenu)&&seleccion.equals("N")&&pru==0)
                {
                    /*ac.setIdmenu(idmenu);
                    ac.setIdrol(idrol);
                    nac.setAc(ac);
                    nac.BorrarAccesos();*/
                }
                if(seleccion.equals("S")){
                    System.out.println("1++s-"+seleccion+" sm-"+idsubmenu+" r-"+idrol);
                    ac.setIdsubmenu(idsubmenu);
                    ac.setIdrol(idrol);
                    nac.setAc(ac);
                    nac.ActualizarSubAccesos();
                }
                else{
                    System.out.println("2++s-"+seleccion+" sm-"+idsubmenu+" r-"+idrol);
                    ac.setIdsubmenu(idsubmenu);
                    ac.setIdrol(idrol);
                    nac.setAc(ac);
                    nac.BorrarSubAccesos();
                }
                
                
            }
            
            if(nac.val==1){
                response.sendRedirect("Accesos.jsp?mensaje=5");
            }
            else{
                response.sendRedirect("Accesos.jsp?mensaje=6");
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
