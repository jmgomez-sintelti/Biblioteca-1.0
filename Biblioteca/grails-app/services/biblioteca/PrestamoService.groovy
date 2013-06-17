package biblioteca

class PrestamoService {

    def estado(prestamoInstance){ 
		
		def ejemplar = prestamoInstance.ejemplares
			ejemplar.each{		
				if(prestamoInstance.estado == true){				
					it.estado = false
					println("cambiado a false")
					}
					else{
					it.estado = true
					println("cambiado a true")
					}								
			}
	}

	def lista(params){
		return Ejemplar.findAllByEstado(true)
	
	}

	

	def listaEdit(prestamoInstance){
		
		def ejemplar = prestamoInstance.ejemplares
		def temporal = Ejemplar.findAllByEstado(true)
		ejemplar.each{
			temporal.add(it)			
			println "listado temporal"
			println it.estado
		}
		return temporal 
	
	}

	def estadoUpdate(prestamoInstance){
		def ejemplar = prestamoInstance.ejemplares
		ejemplar.each{
			it.estado = true
			
		}
	}

	def estadoFalse(prestamoInstance){
		if(prestamoInstance.estado == true){
			def ejemplar = prestamoInstance.ejemplares
			ejemplar.each{
				it.estado = false
			}
		}
		
	}


}
