package biblioteca

class EjemplarService {

    def total(ejemplarInstance){
		
		def totales = 0
		Ejemplar.list().each{
			if(it.estado == true && it.libros.titulo.equals(ejemplarInstance.libros.titulo)){
				totales++
				println(totales)
			}
		}
		return totales
	}

	def totales(ejemplarInstance){
		
		def totales = 0
		Ejemplar.list().each{
			if(it.libros.titulo.equals(ejemplarInstance.libros.titulo)){
				totales++
				println(totales)
			}
		}
		return totales
	}
}
