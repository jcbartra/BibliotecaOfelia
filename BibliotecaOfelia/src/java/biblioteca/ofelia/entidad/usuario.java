package biblioteca.ofelia.entidad;

public class usuario {
    
    String idusuario;
    String idrol;
    String idpersona;
    String usuario;
    String clave;
    String estado;
    String rol;
    // solo para cargar datos de persona pero no es tan en la base de datos
    
    
    String n_ubigeo;
    String n_tipodoc;
    String n_nro;
    String n_sexo;
    String direccion;
    String telefono;
    String foto;

    public usuario() {
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getIdrol() {
        return idrol;
    }

    public void setIdrol(String idrol) {
        this.idrol = idrol;
    }

    public String getIdpersona() {
        return idpersona;
    }

    public void setIdpersona(String idpersona) {
        this.idpersona = idpersona;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getN_ubigeo() {
        return n_ubigeo;
    }

    public void setN_ubigeo(String n_ubigeo) {
        this.n_ubigeo = n_ubigeo;
    }

    public String getN_tipodoc() {
        return n_tipodoc;
    }

    public void setN_tipodoc(String n_tipodoc) {
        this.n_tipodoc = n_tipodoc;
    }

    public String getN_nro() {
        return n_nro;
    }

    public void setN_nro(String n_nro) {
        this.n_nro = n_nro;
    }

    public String getN_sexo() {
        return n_sexo;
    }

    public void setN_sexo(String n_sexo) {
        this.n_sexo = n_sexo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

   
}
