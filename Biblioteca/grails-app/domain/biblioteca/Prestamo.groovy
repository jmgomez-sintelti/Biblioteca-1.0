package biblioteca

class Prestamo {

	Date fPrestamo
	Date fEntrega
	boolean estado = true
	static hasMany = [ejemplares:Ejemplar,usuarios:Usuario]
	

    static constraints = {
    
	}
}
