package biblioteca

class Autor {
	static belongsTo = Libro
	static hasMany = [libros:Libro]
	String nombre
	String aPaterno
	String aMaterno
    static constraints = {
		nombre(size:3..50)
		aPaterno(size:5..50)
		aMaterno(size:5..50)
    }

	String toString(){
	
		return nombre+" "+aPaterno+" "+aMaterno		
	
	} 
}
