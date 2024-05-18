import mensajeros.*

object mensajeria {
	
	// segunda parte
	const mensajeros = []
	// tercera parte
	const enviados = []
	const pendientes = []
	var facturado = 0
  
  	// segunda parte
	method contratar(alguien){
		mensajeros.add(alguien)
	} 
	
	method despedir(alguien){
		mensajeros.remove(alguien)
	}
	
	method despedirATodos(){
		mensajeros.clear() 
	}
	
	method esGrande(){
		return mensajeros.size() > 2
	}
	 
	method elPrimeroPuedeEntregarlo(){
		return paquete.puedeSerEntregadoPor(mensajeros.first())
	}
	
	method pesoDelUltimoMensajero(){
		return mensajeros.last().peso()
	}
	
	//Agregado para los tests  
	method mensajeros() {
	 	return mensajeros
	}
	method enviados() {
	 	return enviados
	}
	method pendientes() {
	 	return pendientes
	}
	
	
	//Tercera parte
	method algunoPuedeEntregar(unPaquete) {
		return mensajeros.any({mens=>unPaquete.puedeSerEntregadoPor(mens)})
	}
	
	method quienesPuedenEntregar(unPaquete) {
		return mensajeros.filter({mens=>unPaquete.puedeSerEntregadoPor(mens)})
	}

	method tieneSobrepeso(){
		return mensajeros.sum({mens=>mens.peso()})/mensajeros.size() > 500
	}
	
	method enviar(unPaquete){
		if (self.algunoPuedeEntregar(unPaquete))  
			//enviados.add(unPaquete)
			facturado += unPaquete.precio()
		else
			pendientes.add(unPaquete)
	}
	
	method facturacion(){
		//return enviados.sum({paq=>paq.precio()})
		return facturado
	}
	
	method enviarVarios(paquetes){
		paquetes.forEach({paq=>self.enviar(paq)})
	}
	
	method enviarPendienteMasCaro(){
		const caro = self.pendienteMasCaro()
		pendientes.remove(caro)
		self.enviar(caro)	
	}
	
	method pendienteMasCaro(){
		return pendientes.max({paq=>paq.precio()})
	}
	

}
