package org.javamexico.grailstest

class Estado {

   	String idEstado
	String nombre
	Pais pais
	Integer poblacion
	
    static constraints = {
	idEstado(blank: false)
	nombre(blank: false)
	pais(nullable: false)
	poblacion(blank: true)
    }

}
