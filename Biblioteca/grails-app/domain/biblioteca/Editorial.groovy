package biblioteca

class Editorial {
	
	String nombre

    static constraints = {
		nombre(blank:false)
    }

	String toString(){
		return nombre
	}
}
