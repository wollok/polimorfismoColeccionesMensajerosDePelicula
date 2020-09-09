import mensajeros.*

object paquetin {
	
	method puedeSerEntregadoPor(mensajero) {
		return true
	}
	method precio() {
		return 0
	}
}

object paqueton {
	const destinos = [brooklyn,matrix]
	const precioUnitario = 100
	var importePagado = 0
	
	method pagar(importe){
		importePagado = importePagado + importe
	}
	
	method estaPago() {
		return importePagado >= self.precio()
	}
	method precio(){	
		return destinos.size()*precioUnitario
	}
	method puedeSerEntregadoPor(mensajero) {
	    return self.puedePasarPorDestinos(mensajero) && self.estaPago() 
	}
	method puedePasarPorDestinos(mensajero) {
		return destinos.all{d=>d.dejarPasar(mensajero)}
	}
}

// Para el punto 9 tercera parte. 
// Implementaciones mínimas, poco creativas
object paqueteInventado{
	method puedeSerEntregadoPor(mens) = false
	method precio() = 1000
}

object mensajeroInventado { 
	method puedeLlamar() = false
	method peso() = 1000 
} 