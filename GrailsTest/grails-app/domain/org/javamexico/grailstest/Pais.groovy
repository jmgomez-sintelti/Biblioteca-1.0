package org.javamexico.grailstest

class Pais {

	
	String nombre
	String continente
	Integer poblacion
	static belongsTo = [pais:Pais]
    static constraints = {
	
	nombre(blank: false)
	continente(blank: true)
	poblacion(nullable: true)
    }

	public String toString(){
		return nombre
	}

}
