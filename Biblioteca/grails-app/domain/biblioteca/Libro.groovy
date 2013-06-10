package biblioteca

class Libro {
	String titulo
	String edicion
	String isbn
	static hasMany = [autores:Autor,editoriales:Editorial]
	static constraints = {
		titulo(size:5..50)
		edicion(size:5..50)
		isbn(size:5..50)
    }

	String toString(){
		return titulo
	}
}