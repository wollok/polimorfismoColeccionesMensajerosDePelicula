// Mensajería parte 4 

import mensajeros1.*

object mensajeria {
	const property mensajeros = []
	const property entregados = []
	// nueva coleccion
	var property pendientes = [paquete,paquetin,paqueton]
	
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
			error.throwWithMessage("No hay mensajeros disponibles")
		
		entregados.add(unPaquete)
		pendientes.remove( unPaquete)
		
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

object paquetin {
	
	method puedeSerEntregadoPor(mensajero) {
		return true
	}
	method precio() = 0
	
}

object paqueton {
	var destinos = [brooklyn,matrix]
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