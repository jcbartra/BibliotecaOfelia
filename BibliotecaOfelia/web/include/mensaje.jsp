    <%
        String mensaje=(String)request.getParameter("mensaje");if(mensaje==null){mensaje="";}
        String style="";
        
        if(mensaje.equals("1")){
            mensaje="SE INGRES� CORRECTAMENTE";
            style="text-primary";
        }
        if(mensaje.equals("2")){
            mensaje="NO SE INGRES�";
            style="text-danger";
        }
        if(mensaje.equals("3")){
            mensaje="SE ELIMIN� CORRECTAMENTE";
            style="text-primary";
        }
        if(mensaje.equals("4")){
            mensaje="NO SE ELIMIN�";
            style="text-danger";
        }
        if(mensaje.equals("5")){
            mensaje="SE ACTUALIZ� CORRECTAMENTE";
            style="text-primary";
        }
        if(mensaje.equals("6")){
            mensaje="NO SE ACTUALIZ�";
            style="text-danger";
        }
    %>