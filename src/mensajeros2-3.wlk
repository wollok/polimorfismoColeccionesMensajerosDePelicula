// Mensajería partes 2 y 3

import mensajeros1.*

object mensajeria {
	var mensajeros = []
	var entregas = []
	
	method agregar(empleado){
		mensajeros.add(empleado)
	}
	method empleados() {
		return mensajeros
	}
	method algunoPuedeEntregar(unPaquete) {
		return mensajeros.any({mens=>unPaquete.puedeSerEntregadoPor(mens)})
	}
	method candidatosPara(unPaquete) {
		return mensajeros.filter({mens=>unPaquete.puedeSerEntregadoPor(mens)})
	}
	method enviar(unPaquete){
		entregas.add(unPaquete)
	}
	method despedirATodos(){
		mensajeros.clear()
	}
	method pesoPromedio(){
		return mensajeros.sum({mens=>mens.peso()})/mensajeros.size()
	}
	method tieneSobrepeso(){
		return self.pesoPromedio()> 500
	}
}
