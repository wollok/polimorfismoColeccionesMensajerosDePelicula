// Mensajería partes 2 y 3 y mas alla

import mensajeros1.*

object mensajeria {
	var mensajeros = []
	var entregados = []
	
	//Segunda parte 
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
	method elPrimeroPuedeEntregar() {
		return paquete.puedeSerEntregadoPor(mensajeros.first())
	}
	method pesoDelUltimo(){
		return mensajeros.last().peso()
	}
	
	//solo para testear
	method mensajeros(){
		return mensajeros
	}
	//solo para testear
	method entregados() {
		return entregados
	}
	
	
	//Tercera parte
	method algunoPuedeEntregar() {
		return mensajeros.any({mens=>paquete.puedeSerEntregadoPor(mens)})
	}
	method paqueteFacil() {
		return mensajeros.all({mens=>paquete.puedeSerEntregadoPor(mens)})
	}
	method candidatosPara() {
		return mensajeros.filter({mens=>paquete.puedeSerEntregadoPor(mens)})
	}
	method tieneSobrepeso(){
		return self.pesoPromedio()> 500
	}
	method pesoPromedio(){
		return mensajeros.sum({mens=>mens.peso()})/mensajeros.size()
	}
	method enviar(){
		if (!self.algunoPuedeEntregar())  
			error.throwWithMessage("No hay mensajeros disponibles")
		
		entregados.add(paquete)
		
	}
}
