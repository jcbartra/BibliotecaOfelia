<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 
<br />
<%
    String dni=(String) request.getParameter("dni");
    String ejemplar=(String) request.getParameter("ejemplar");
    String cons=""+ejemplar.length() ;
    int contex=Integer.parseInt(cons);
    
    if(contex==1){ejemplar="000"+ejemplar;}
    if(contex==2){ejemplar="00"+ejemplar;}
    if(contex==3){ejemplar="0"+ejemplar;}
    if(contex==4){ejemplar=ejemplar;}
    
    int idejemplar=Integer.parseInt(ejemplar);
    
    
    persona p=new persona();
    n_persona np=new n_persona();
    
    p.setNro_doc(dni);
    
    np.setP(p);
    np.Buscar_Persona_dni();
    if(np.val==1){
        //p.getIdpersona()
%>
        <div class="col-sm-12" align="center"> 
            <div class="col-sm-4">
                <img class="img-bordered" src="<%=p.getFoto()%>" width="63" height="63" />
                <input type="hidden" name="persona" id="persona" value="<%=p.getIdpersona()%>">
            </div>
            
            <div class="col-sm-8">
            <strong><%=p.getNombres()%> (<%=p.getNro_doc()%>)</strong>
            </div>
            <div class="col-sm-8">
            <strong><%=p.getTipo_lector()%></strong>
            </div>
            <div class="col-sm-8" id="botones<%=idejemplar%>">
            <a class="btn btn-primary btn-xs" onclick="Mostrarl(persona.value,<%=ejemplar%>);"><i class="fa fa-check" aria-hidden="true"></i></a>
            <a class="btn btn-warning btn-xs" onclick="Ocultarl(persona.value,<%=ejemplar%>);"><i class="fa fa-close" aria-hidden="true"></i></a>                    
            </div>
        </div>
            <br />
        <div class="col-sm-12" align="center">
            
        </div>    

<%
    }
    else{
%>
        <h4>El Número de Documento <strong><%=dni%></strong> no Existe o no Está Registrado como Lector</h4>            
<%
    }
%>
