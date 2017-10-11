/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.entidad;

/**
 *
 * @author Alex Maluquish
 */
public class tipo_doc {
    String  idtipodoc;
    String nombre;
    String estado;

    public tipo_doc() {
    }

    public String getIdtipodoc() {
        return idtipodoc;
    }

    public void setIdtipodoc(String idtipodoc) {
        this.idtipodoc = idtipodoc;
    }

   
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
