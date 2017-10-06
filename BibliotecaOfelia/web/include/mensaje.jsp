    <%
        String mensaje=(String)request.getParameter("mensaje");if(mensaje==null){mensaje="";}
        String style="";
        
        if(mensaje.equals("1")){
            mensaje="SE INGRESÓ CORRECTAMENTE";
            style="text-primary";
        }
        if(mensaje.equals("2")){
            mensaje="NO SE INGRESÓ";
            style="text-danger";
        }
        if(mensaje.equals("3")){
            mensaje="SE ELIMINÓ CORRECTAMENTE";
            style="text-primary";
        }
        if(mensaje.equals("4")){
            mensaje="NO SE ELIMINÓ";
            style="text-danger";
        }
        if(mensaje.equals("5")){
            mensaje="SE ACTUALIZÓ CORRECTAMENTE";
            style="text-primary";
        }
        if(mensaje.equals("6")){
            mensaje="NO SE ACTUALIZÓ";
            style="text-danger";
        }
    %>