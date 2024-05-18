// Mensajeros de película, primera parte

object roberto {
	var peso = 90
	var transporte = camion

	method peso() {
		return peso + transporte.peso()
	}

	method transporte(vehiculo) {
		transporte = vehiculo
	}

	method puedeLlamar() {
		return false
	}
	
	method peso(nuevoPeso){
		peso = nuevoPeso
	}
}

object neo { 
	
	var tieneCredito = false
	
	method peso() {
		return 0
	}

	method puedeLlamar() {
		return tieneCredito
	}
	
	method recargar() {
		tieneCredito = true
	}
	
}    

object chuck { 

	method peso() {
		return 900 
	}

	method puedeLlamar() {
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
   const peso = 1

	method peso() {
		return peso
	}
}

object brooklyn {

	method dejarPasar(mensajero) {
		return mensajero.peso() < 1000
	}
}
object matrix {

	method dejarPasar(mensajero) {
		return mensajero.puedeLlamar()
	}
	
}

object paquete {
	var pago = false
	var destino = brooklyn

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
	
	//agregado para parte 3
	method precio() = 50
}