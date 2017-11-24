/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.controller;

import biblioteca.ofelia.entidad.persona;
import biblioteca.ofelia.procesos.n_persona;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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

                java.util.Date utilDate = new java.util.Date(); //fecha actual en la que se hizo el registro
                long lnMilisegundos = utilDate.getTime();
                java.sql.Date registro = new java.sql.Date(lnMilisegundos);
                String fecha_registro = registro.toString();
                /*FileItemFactory es una interfaz para crear FileItem*/
                FileItemFactory file_factory = new DiskFileItemFactory();

                /*ServletFileUpload esta clase convierte los input file a FileItem*/
                ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
                /*sacando los FileItem del ServletFileUpload en una lista */

                try {
                    List items = servlet_up.parseRequest(request);
                    /*declaramos un hashmap donde guardaremos los parametros*/
                    HashMap<String, String> parametros = new HashMap<String, String>();
                    for (int i = 0; i < items.size(); i++) {
                        /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
                        FileItem item = (FileItem) items.get(i);
                        /*item.isFormField() false=input file; true=text field*/
                        String valor = "";
                        if (item.isFormField()) {
                            valor = item.getString();
                        } else {
                            /*creamos un nombre, para que no se sobbre-escriban archivos*/
                            valor = parametros.get("nro_doc") + ".jpg";
                            /*cual sera la ruta al archivo en el servidor*/
                            File archivo_server = new File("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 8.5\\webapps\\BibliotecaOfelia\\Recursos\\img\\personas\\" + valor);
                            /*y lo escribimos en el servido*/
                            item.write(archivo_server);
                        }
                        /*guardamos los parametros dentro del hashmap*/
                        parametros.put(item.getFieldName().toLowerCase(), valor);
                    }

                    /*Capturamos todos datos de los inpus que guardamos en el hashmap*/
                    String idtipodo = parametros.get("idtipodoc");
                    String idubige = parametros.get("idubigeo");
                    String nombre = parametros.get("nombres");
                    String ape_patern = parametros.get("ape_paterno");
                    String ape_matern = parametros.get("ape_materno");
                    String gener = parametros.get("genero");
                    String fecha_nacimient = parametros.get("fecha_nacimiento");
                    String nro_do = parametros.get("nro_doc");
                    String direccio = parametros.get("direccion");
                    String telefon = parametros.get("telefono");
                    String fot = "Recursos/img/personas/"+parametros.get("nro_doc")+".jpg";

                    p.setIdtipodoc(idtipodo);
                    p.setIdubigeo(idubige);
                    p.setNombres(nombre.toUpperCase());
                    p.setApe_paterno(ape_patern.toUpperCase());
                    p.setApe_materno(ape_matern.toUpperCase());
                    p.setGenero(gener.toUpperCase());
                    p.setNro_doc(nro_do);
                    p.setFecha_nacimiento(fecha_nacimient);
                    p.setDireccion(direccio.toUpperCase());
                    p.setTelefono(telefon);
                    p.setFoto(fot);

                    np.setP(p);

                    np.InsertarPersona();

                    if (np.val == 1) {
                        response.sendRedirect("Persona.jsp?mensaje=1");
                    } else {
                        response.sendRedirect("Persona.jsp?mensaje=2");
                    }

                } catch (Exception e) {

                }

            }

            if (op.equals("eliminar")) {
                p.setIdpersona(id);
                np.setP(p);
                np.Eliminar();
                if (np.val == 1) {
                    response.sendRedirect("Persona.jsp?mensaje=1");
                } else {
                    response.sendRedirect("Persona.jsp?mensaje=2");
                }
            }

            if (op.equals("update_persona")) {

                p.setIdtipodoc(idtipodoc);
                p.setIdubigeo(idubigeo);
                p.setNombres(nombres.toUpperCase());
                p.setApe_paterno(ape_paterno.toUpperCase());
                p.setApe_materno(ape_materno.toUpperCase());
                p.setGenero(genero);
                p.setNro_doc(nro_doc);
                p.setFecha_nacimiento(fecha_nacimiento);
                p.setDireccion(direccion.toUpperCase());
                p.setTelefono(telefono);
                p.setFoto(foto);
                p.setIdpersona(id);

                np.setP(p);

                np.actualizar();

                if (np.val == 1) {
                    response.sendRedirect("Persona.jsp?mensaje=5");
                } else {
                    response.sendRedirect("Persona.jsp?mensaje=6");
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
