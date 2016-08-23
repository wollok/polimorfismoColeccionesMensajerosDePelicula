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
	var acoplados = 2

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
	var credito = 10

	method peso() {
		return 0
	}

	method consumirCredito(cantidad) {
		credito = credito - cantidad
	}

	method tieneCredito() {
		return credito > 0
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
	var pago = false
	var destino

	method pagar() {
		pago = true
	}

	method estaPago() {
		return pago
	}

	method destino(lugar) {
		destino = lugar
	}

	method puedeSerEntregadoPor(mensajero) {
		return destino.dejarPasar(mensajero) and self.estaPago()
	}
}