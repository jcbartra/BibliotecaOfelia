<%-- 
    Document   : prueb2
    Created on : 14/11/2017, 06:32:56 PM
    Author     : JcBartra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
<script>
function buscarSelect()
{
	// creamos un variable que hace referencia al select
	var select=document.getElementById("elementos");
 
	// obtenemos el valor a buscar
	var buscar=document.getElementById("buscar").value;
 
	// recorremos todos los valores del select
	for(var i=1;i<select.length;i++)
	{
		if(select.options[i].text==buscar)
		{
			// seleccionamos el valor que coincide
			select.selectedIndex=i;
		}
	}
}
</script>
	</head>
	<body>
		<h2>Introduce un valor en el cuadro de texto que exista dentro del select y pulsa en buscar</h2>
		<form onsubmit="return false">
			<input type="text" id="buscar"><input type="submit" value="buscar" onclick="buscarSelect()">
			<p>
				<select id="elementos">
					<option value="0">...</option>
					<option value="1">coche</option>
					<option value="2">avion</option>
					<option value="3">moto</option>
					<option value="4">tren</option>
				</select>
			</p>
		</form>
	</body>
</html>
