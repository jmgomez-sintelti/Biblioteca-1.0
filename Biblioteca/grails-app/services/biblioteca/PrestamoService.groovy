package biblioteca

class PrestamoService {

    def estado(params){ 
		
		def ejemplar = params.list('ejemplares')
		Iterator iter = ejemplar.iterator()
		
		while (iter.hasNext()){
				def objeto = Ejemplar.get(iter.next())
				objeto.estado = false								
		}
	}

	def lista(params){
		
		def lista = []
		
		Ejemplar.list().each{
			
			if(it.estado == true){
				lista.push(it)
				println(it)
			}
		}
			
		return lista
	}

}
