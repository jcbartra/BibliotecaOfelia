function validar_email(email)
{
	valido=document.getElementById('emailOK');
	var caract= new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/);//para comparar el email
	if(caract.test(email)==false)
	{
		alert("El Email Ingresado no es Válido");
		return false;
	}else{
		valido.innerText="El Email es Correcto";
		return true;
	}
	
};

function validaL(l){
            tecla = (document.all) ? l.keyCode : l.which;

            //Tecla de retroceso para borrar, siempre la permite
            if (tecla<=8){
                return true;
            }

            // Patron de entrada, en este caso solo acepta letras
            patron =/[a-zA-Z ]/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }
function validaN(n){
            tecla = (document.all) ? n.keyCode : n.which;

            //Tecla de retroceso para borrar, siempre la permite
            if (tecla<=8){
                return true;
            }

            // Patron de entrada, en este caso solo acepta números
            patron =/[0-9]/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }
function validaD(d){
            tecla = (document.all) ? d.keyCode : d.which;

            //Tecla de retroceso para borrar, siempre la permite
            if (tecla<=8){
                return true;
            }

            // Patron de entrada, en este caso solo acepta números y letras
            patron =/[a-zA-Z0-9-/$ ]/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }