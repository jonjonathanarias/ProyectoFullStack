const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');

const expresiones = {
	duenio: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, 
	modelo: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, 
    patente: /^[A-Z0-9À-ÿ\s]{1,40}$/, 
	
}

const campos = {
	duenio: false,
	modelo: false,
	patente: false,
}

const validarFormulario = (e) => {
	switch (e.target.name) {
		case "duenio":
			validarCampo(expresiones.duenio, e.target, 'duenio');
		break;
		case "modelo":
			validarCampo(expresiones.auto, e.target, 'modelo');
		break;
		case "patente":
			validarCampo(expresiones.patente, e.target, 'patente');
		break;
	}
}

const validarCampo = (expresion, input, campo) => {
	if(expresion.test(input.value)){
		document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-incorrecto');
		document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-correcto');
		document.querySelector(`#grupo__${campo} i`).classList.add('fa-check-circle');
		document.querySelector(`#grupo__${campo} i`).classList.remove('fa-times-circle');
		document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.remove('formulario__input-error-activo');
		campos[campo] = true;
	} else {
		document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-incorrecto');
		document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-correcto');
		document.querySelector(`#grupo__${campo} i`).classList.add('fa-times-circle');
		document.querySelector(`#grupo__${campo} i`).classList.remove('fa-check-circle');
		document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.add('formulario__input-error-activo');
		campos[campo] = false;
	}
}


inputs.forEach((input) => {
	input.addEventListener('keyup', validarFormulario);
	input.addEventListener('blur', validarFormulario);
});
