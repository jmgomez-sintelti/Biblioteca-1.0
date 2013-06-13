package biblioteca

class Usuario {
	
	String nombre
	String aPaterno
	String aMaterno
	String direccion
		

    static constraints = {
		nombre(blank:false)
		aPaterno(blank:false)
		aMaterno(blank:false)
		direccion(blank:false)
    }
		
	String toString(){
		return nombre+" "+aPaterno+" "+aMaterno
	}

}
