// Mensajeros de pelicula, primera parte

object roberto {
	var peso = 90 
	var transporte = camion 

	method peso() {
		return peso + transporte.peso()
	}

	method transporte(vehiculo) {
		transporte = vehiculo
	}

	method tieneCredito() {
		return false
	}
}

object chuck {
	var peso = 900
	
	method peso() {
		return peso
	}
	
	method tieneCredito() {
		return true
	}
} 

object camion {
	var property acoplados = 2

	method peso() {
		return acoplados * 500
	}

	method acoplados(cantAcoplados) {
		acoplados = cantAcoplados
	}
}

object bicicleta {

	method peso() {
		return 0
	}
}

object neo {
	var credito = 7

	method peso() {
		return 0
	}

	method llamar() {
		credito = credito - 5
	}

	method tieneCredito() {
		return credito > 5
	}
}

object brooklyn {

	method dejarPasar(mensajero) {
		return mensajero.peso() < 1000
	}
}

object matrix {

	method dejarPasar(mensajero) {
		return  mensajero.tieneCredito()
	}
}

object paquete {
	var estaPago = false
	var destino = matrix

	method pagar() {
		estaPago = true
	}

	method estaPago() {
		return estaPago
	}

	method destino(lugar) {
		destino = lugar
	}

	method puedeSerEntregadoPor(mensajero) {
		return destino.dejarPasar(mensajero) and self.estaPago()
	}
	
	//Solo para parte 4
	method precio() = 50
}

