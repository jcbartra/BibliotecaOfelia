<%
    String idejemplar = (String) request.getParameter("id");
    String cons=""+idejemplar.length() ;
    int contex=Integer.parseInt(cons);
    
    if(contex==1){idejemplar="000"+idejemplar;}
    if(contex==2){idejemplar="00"+idejemplar;}
    if(contex==3){idejemplar="0"+idejemplar;}
    if(contex==4){idejemplar=idejemplar;}
    int ejemplar=Integer.parseInt(idejemplar);
    if (idejemplar == null) {
        idejemplar = "%";
    }
    String idusuario = (String) session.getAttribute("idusuario");
    if (idusuario == null) {
        idusuario = "";
    }

%>

<div class="modal-dialog" role="document">
    <div class="modal-content">

        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title"><i class="ion-ios-book"></i> Agregar Prestamo</h4>
        </div>

        <div class="modal-body" align="center">

            <form action="ControlPrestamo" method="post">
                <input type="hidden" name="op" value="add_prestamo">
                <input type="hidden" name="idejemplar" id="ejemplar<%=idejemplar%>" value="<%=idejemplar%>">
                <input type="hidden" name="idpersona" id="idpersona<%=ejemplar%>" value="">
                <input type="hidden" name="idusuario" value="<%=idusuario%>">
                <div class="form-inline form-group col-sm-12" align="center">
                    <div class="col-sm-12" align="center"> 
                        <h5 style="font-weight: bold;">Buscar por Número de Documento de la Persona</h5>
                    </div>
                    <label for="numeroDocumento" class="col-sm-5 control-label">*Número de documento: </label>
                    <div class="col-sm-5">
                        <input name="dni" id="dni" type="text" autocomplete="off" class="form-control" placeholder="Número de documento" title="Número de documento" onkeypress="return validaN(event);">
                    </div>
                    <div class="col-sm-2">
                        <a class="btn btn-default" onclick="cargarDni(dni.value,<%=idejemplar%>);"><i class="fa fa-search" aria-hidden="true"></i></a>
                    </div>
                </div>  

                <div class="form-inline form-group col-sm-12" align="center"> 
                    <div class="col-sm-12" align="center"> 
                        <h5 style="font-weight: bold;">Buscar por Datos de la Persona</h5>
                    </div>
                    <div class="col-sm-10">
                        <label for="nombrePer" class="control-label">*Nom: </label>
                        <input name="nom" id="nom" size="5" type="text" autocomplete="off" class="form-control" placeholder="Nombre" title="Nombre" onkeypress="return validaL(event);">
                        &nbsp;&nbsp;<label for="appatPer" class="control-label">*Pat: </label>
                        <input name="pat" id="pat" size="5" type="text" autocomplete="off" class="form-control" placeholder="ApPaterno" title="ApPaterno" onkeypress="return validaL(event);">
                        &nbsp;&nbsp;<label for="apmatPer" class="control-label">*Mat: </label>
                        <input name="mat" id="mat" size="5" type="text" autocomplete="off" class="form-control" placeholder="ApMaterno" title="ApMaterno" onkeypress="return validaL(event);">
                    </div>
                    <div class="col-sm-2">
                        <a class="btn btn-default" onclick="cargarDatos(nom.value,pat.value,mat.value,<%=idejemplar%>);"><i class="fa fa-search" aria-hidden="true"></i></a>
                    </div>
                </div>

                <div class="form-inline form-group col-sm-12" style="border-bottom: 1px solid #e5e5e5; border-top: 1px solid #e5e5e5;" align="center" id="mostrarOpcion<%=ejemplar%>">
                    aqui se mostrara el resultado
                </div> 

                <div class="form-inline form-group col-sm-12" style="border-bottom: 1px solid #e5e5e5; display:none;" align="center" id="mostrarRegistro<%=ejemplar%>">
                    <div class="col-sm-12"><br /></div>
                    <h5 style="font-weight: bold;">Registro de Prestamo</h5>
                    <div class="col-sm-12"><br /></div>
                    <label for="F-Entrega" class="col-sm-5 control-label">*Fecha de Entrega: </label>
                    <div class="col-sm-7">
                        <input name="fecha_entrega" type="date" autocomplete="off" class="form-control" placeholder="Fecha de Entrega">
                    </div>
                    <div class="col-sm-12"><br /></div>
                    <label for="H-Entrega" class="col-sm-5 control-label">*Hora de Entrega: </label>
                    <div class="col-sm-7">
                        <input name="hora_entrega" maxlength="2" type="text" autocomplete="off" class="form-control" placeholder="HH" size="2">:
                        <input name="minuto_entrega" maxlength="2" type="text" autocomplete="off" class="form-control" placeholder="MM" size="2">
                    </div>
                    <div class="col-sm-12"><br /></div>
                </div>     

        

        <div class="modal-footer">
            <button type="submit" class="btn btn-primary" disabled id="btnReg<%=ejemplar%>"><i class="fa fa-floppy-o" aria-hidden="true"></i> Registrar</button>
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</button>  
        </div>
        </form></div>
    </div>
</div>
