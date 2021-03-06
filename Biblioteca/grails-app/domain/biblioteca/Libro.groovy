package biblioteca

class Libro {
	String titulo
	String edicion
	String isbn
	static hasMany = [autores:Autor,editoriales:Editorial]
	
	static constraints = {
		titulo(blank:false)
		edicion(blank:false)
		isbn(blank:false)
    }

	String toString(){
		return titulo
	}
}
