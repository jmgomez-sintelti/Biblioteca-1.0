package biblioteca

class Usuario {
	
	String nombre
	String aPaterno
	String aMaterno
	String direccion
		

    static constraints = {
		nombre(size:3..50)
		aPaterno(size:5..50)
		aMaterno(size:5..50)
		direccion(size:5..50)
    }
		
	String toString(){
		return nombre+" "+aPaterno+" "+aMaterno
	}

}
