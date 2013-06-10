package biblioteca

class Editorial {
	
	String nombre

    static constraints = {
		nombre(size:5..30)
    }

	String toString(){
		return nombre
	}
}
