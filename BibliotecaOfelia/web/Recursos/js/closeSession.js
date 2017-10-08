function redireccion() {
    alert("tu tiempo se ha agotado");
    window.location = "login.jsp";
}

// se llamará a la función que redirecciona después de 1hr (3600.000 segundos)
var temp = setTimeout(redireccion, 3600000);

// cuando se pulse en cualquier parte del documento
document.addEventListener("click", function() {
    // borrar el temporizador que redireccionaba
    clearTimeout(temp);
    // y volver a iniciarlo
    temp = setTimeout(redireccion, 3600000);
})