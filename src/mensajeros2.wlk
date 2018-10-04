// Mensajería partes 2 y 3 y mas alla

import mensajeros1.*

object mensajeria {
	var mensajeros = []
	var property entregas = []
	
	//Segunda parte 
	method contratar(empleado){
		mensajeros.add(empleado)
	}
	method despedirATodos() {
		//hola
		mensajeros.clear()
	}
	method despedir(empleado){
		mensajeros.remove(empleado)
	}
	method esGrande(){
		return mensajeros.size()>2
	} 
	method elPrimeroPuedeEntregar() {
		return paquete.puedeSerEntregadoPor(mensajeros.first())
	}
	method pesoDelUltimo(){
		return mensajeros.last().peso()
	}
	method mensajeros(){
		return mensajeros
	}
	
	//Tercera parte
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
		
		entregas.add(unPaquete)
		
	}
}
