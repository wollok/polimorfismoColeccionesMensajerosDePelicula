// Mensajeros de pelicula, quinta parte

class Transportista  {
	var peso = 90
	var property transporte = new Camion(acoplados=1)

	method peso() {
		return peso + transporte.peso()
	}

	method tieneCredito() = false
}

object chuck {
	const property peso = 900
	method tieneCredito() = true 
} 

class Camion{
	var property acoplados = 2
	method peso() = acoplados * 500
}

object bicicleta {
	method peso() = 0
}

object neo {
	var credito = 7

	method peso() = 0

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
	var property precio = 50

	method pagar() {
		estaPago = true
	}

	method puedeSerEntregadoPor(mensajero) {
		return destino.dejarPasar(mensajero) and self.estaPago()
	}
}

class Paquetin {
	
	method puedeSerEntregadoPor(mensajero) {
		return true
	}
	method precio() = 0
}

class Paqueton {
	var destinos = []
	var precioUnitario = 100
	var importePagado = 0

	method pagar(){
		importePagado += 100 
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

object mensajeria {
	const property mensajeros = []
	const property entregados = []
	// nueva coleccion
	var property pendientes = []
	
	//Igual a la segunda parte 
	method contratar(empleado){
		mensajeros.add(empleado)
	}
	method despedirATodos() {
		mensajeros.clear() 
	}
	method despedir(empleado){
		mensajeros.remove(empleado)
	}
	method esGrande(){
		return mensajeros.size()>2
	} 
	method elPrimeroPuedeEntregar(unPaquete) {
		return unPaquete.puedeSerEntregadoPor(mensajeros.first())
	}
	method pesoDelUltimo(){
		return mensajeros.last().peso()
	}
	

	//Como la tercera parte, con el paquete como parametro  
	method algunoPuedeEntregar(unPaquete) {
		return mensajeros.any({mens=>unPaquete.puedeSerEntregadoPor(mens)})
	}
	method paqueteFacil(unPaquete) {
		return mensajeros.all({mens=>unPaquete.puedeSerEntregadoPor(mens)})
	}
	method candidatosPara(unPaquete) {
		return mensajeros.filter({mens=>unPaquete.puedeSerEntregadoPor(mens)})
	}
	method tieneSobrepeso(){
		return self.pesoPromedio()> 500
	}
	method pesoPromedio(){
		return mensajeros.sum({mens=>mens.peso()})/mensajeros.size()
	}
	method enviar(unPaquete){
		if (!self.algunoPuedeEntregar(unPaquete))  
			self.error("No hay mensajeros disponibles")
		
		entregados.add(unPaquete)
		pendientes.remove(unPaquete)
		
	}
	// nuevos requerimientos cuarta parte
	method enviarTodos() {
		self.paquetesAEnviar().forEach{
			paquete=>self.enviar(paquete)
		}
	}
	method paquetesAEnviar(){
		return pendientes.filter{paq=>self.algunoPuedeEntregar(paq)}
	}
	method paqueteMasCaro(){
		return pendientes.max{paq=>paq.precio()}
	}
}
