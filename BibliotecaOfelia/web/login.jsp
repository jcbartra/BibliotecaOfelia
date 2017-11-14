<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate(); 
%>
<jsp:useBean id="alerta" scope="request" class="java.lang.String"/>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="Recursos/css/bootstrap.css">
        <link rel="stylesheet" href="Recursos/css/MyStyle.css">
        <script src="Recursos/js/jquery-2.2.3.min.js"></script>
        <script src="Recursos/js/typed.js"></script>
        <script src="Recursos/js/bootstrap.min.js"></script>
        <script src="Recursos/js/custom.js" type="text/javascript"></script>
    </head>
    <body class="fondo-walpaper" onload="nb();">
        <div class="container">
            <div class="row">
                <h2><span class="bbl" id="typed">Colegio</span> </h2>
            </div>
            <div class="row">
                <br class="hidden-lg hidden-md"><br class="hidden-lg hidden-md">
                <h4 id="typed2"></h4> 
            </div>
            <div class="row">
                <div class="col-md-6 col-md-offset-3 col-xs-8 col-xs-offset-2">
                    <div class="formulario col-md-10 col-md-offset-1">
                        <center>
                            <div class="icon">	  
                                <img src="Recursos/img/insigniaOV.png"  height="150">
                            </div>
                        </center><br>
                        <form action="logeo" method="post" name="login" id="login" >

                            <div class="col-md-10 col-md-offset-1" >
                                <div class="form-group" id="campo-user">
                                    <label class="control-label"  for="Usuario">USUARIO</label>
                                    <input type="text" class="form-control" name="user" placeholder="Escribe tu usuario" id="input-user" autocomplete="off">
                                    <span id="span-user"></span>

                                </div>
                            </div>

                            <div class="col-md-10 col-md-offset-1" >
                                <div class="form-group" id="campo-pass">
                                    <label class="control-label" for="Clave" >CONTRASEÑA</label>
                                    <input type="password" class="form-control" name="pass" placeholder="Escribe tu contraseña" id="input-pass" autocomplete="off">
                                    <span id="span-pass"></span>
                                </div>
                            </div>
                            <div class="form-group col-md-12" id="alerta">
                            </div>
                            <div class="form-group col-md-8 col-md-offset-2">
                                <button id="enviar" type="submit" class="entrar">ENTRAR</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div><br><br>

        </div>
        <script>
            (function () {

                var form = document.getElementsByName("login")[0],
                        elm = form.elements,
                        btn_enviar = document.getElementById("enviar"),
                        input_usuario = document.getElementById("input-user"),
                        input_pass = document.getElementById("input-pass"),
                        /*ATRIBUTOS PARA EL ERROR*/
                        icon_error = "<span class='glyphicon glyphicon-remove form-control-feedback' aria-hidden='true'></span>",
                        campo_class = "form-group has-error has-feedback",
                        input_aria = "inputError2Status",
                        span_class = "glyphicon glyphicon-remove form-control-feedback",
                        span_aria = "true",
                        /*PARA LIMPIAR CAMPO*/
                        campo_class_l = "form-group",
                        /*ELEMENTOS DOM*/
                        campo_user = document.getElementById("campo-user"),
                        span_user = document.getElementById("span-user"),
                        input_user = document.getElementById("input-user"),
                        campo_pass = document.getElementById("campo-pass"),
                        span_pass = document.getElementById("span-pass"),
                        input_pass = document.getElementById("input-pass"),
                        /*ALERTA ERROR*/
                        alerta_error = document.getElementById("alerta"),
                        string_alerta = "<span class='alerta-error'>El usuario ó contraseña son incorrectos. Intentalo de nuevo *</span>",
                        string_alerta2 = "<span class='alerta-error'>Aseguraté de llenar todos los campos *</span>";

                var validarUser = function (e) {
                    if (form.user.value == 0) {
                        e.preventDefault();
                        campo_user.setAttribute("class", campo_class);
                        span_user.setAttribute("class", span_class);
                        span_user.setAttribute("aria-hidden", span_aria);
                        input_user.setAttribute("aria-describedby", input_aria);
                        input_user.setAttribute("placeholder", "Tienes que escribir tu usuario");
                        alerta_error.innerHTML = string_alerta2;
                    }
                    ;
                };
                var validarContraceña = function (e) {
                    if (form.pass.value == 0) {
                        e.preventDefault();
                        campo_pass.setAttribute("class", campo_class);
                        span_pass.setAttribute("class", span_class);
                        span_pass.setAttribute("aria-hidden", span_aria);
                        input_pass.setAttribute("aria-describedby", input_aria);
                        input_pass.setAttribute("placeholder", "Tienes que escribir tu contraseña");
                        alerta_error.innerHTML = string_alerta2;
                    }
                    ;
                };
                var errorUser = function () {
                    campo_user.setAttribute("class", campo_class);
                    span_user.setAttribute("class", span_class);
                    span_user.setAttribute("aria-hidden", span_aria);
                    input_user.setAttribute("aria-describedby", input_aria);
                    input_user.setAttribute("placeholder", "Upps! vuelva a escribir su usuario");
                };
                var errorContraceña = function () {
                    campo_pass.setAttribute("class", campo_class);
                    span_pass.setAttribute("class", span_class);
                    span_pass.setAttribute("aria-hidden", span_aria);
                    input_pass.setAttribute("aria-describedby", input_aria);
                    input_pass.setAttribute("placeholder", "Upps! vuelva a escribir su contraseña");
                };
                var errorAlerta = function () {
                    alerta_error.innerHTML = string_alerta;
                };
                var errorCampo = function () {
                    errorAlerta();
                    errorContraceña();
                    errorUser();
                };
                var validar = function (e) {
                    validarUser(e);
                    validarContraceña(e);
                };
                var limpiarUser = function (e) {
                    campo_user.setAttribute("class", campo_class_l);
                    span_user.removeAttribute("class");
                    span_user.removeAttribute("aria-hidden");
                    input_user.removeAttribute("aria-describedby");
                };
                var limpiarPass = function (e) {
                    campo_pass.setAttribute("class", campo_class_l);
                    span_pass.removeAttribute("class");
                    span_pass.removeAttribute("aria-hidden");
                    input_pass.removeAttribute("aria-describedby");
                };

                /*errorCampo();*/
            <%
                if (alerta != null) {
                    out.println(alerta);
                }
            %>
                form.addEventListener("submit", validar);
                input_usuario.addEventListener("keypress", limpiarUser);
                input_pass.addEventListener("keypress", limpiarPass);
            }());
        </script>
        <script type="text/javascript">
            $(function () {
                $("#typed").typed({
                    strings: ["BIENVENIDO(A) A LA", "BIBLIOTECA INSTITUCIONAL"],
                    typeSpeed: 20,
                    backDelay: 500,
                    loop: false,
                    loopCount: true,
                    callback: function () {
                        foo();
                    }
                });

                $("#typed2").typed({
                    strings: ["  ", "I.E Ofelia Velasquez Moreno - Tarapoto"],
                    typeSpeed: 20,
                    backDelay: 4000,
                    loop: false,
                    loopCount: false,
                    callback: function () {
                        foo();
                    }
                });
                function foo() {
                    console.log("Callback");
                }
            });
        </script>

    </body>

</html>
