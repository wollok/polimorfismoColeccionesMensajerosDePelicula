// Mensajeros de pelicula, primera parte

class Transportista {
	var peso = 90
	var property transporte = new Camion(acoplados=1)

	method peso() {
		return peso + transporte.peso()
	}

//	method transporte(vehiculo) {
//		transporte = vehiculo
//	}

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

class Camion {
	var property acoplados = 2

	method peso() {
		return acoplados * 500
	}

//	method acoplados(cantAcoplados) {
//		acoplados = cantAcoplados
//	}
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

class Paquete {
	var property estaPago = false
	var property destino = matrix

	method pagar() {
		estaPago = true
	}

//	method estaPago() {
//		return estaPago
//	}

//	method destino(lugar) {
//		destino = lugar
//	}

	method puedeSerEntregadoPor(mensajero) {
		return destino.dejarPasar(mensajero) and self.estaPago()
	}
}

class Paquetin {
	
	method puedeSerEntregadoPor(mensajero) {
		return true
	}
}

class Paqueton {
	var destinos = []
	var precioUnitario = 100
	var importePagado = 0
	
	method pagar(monto){
		importePagado += monto 
	}
	
	method estaPago() {
		return importePagado >= destinos.size()*precioUnitario
	}
	method puedeSerEntregadoPor(mensajero) {
	    return self.puedePasarPorDestinos(mensajero) && self.estaPago() 
	}
	method puedePasarPorDestinos(mensajero) {
		return destinos.all{d=>d.dejaPasar(mensajero)}
	}
}