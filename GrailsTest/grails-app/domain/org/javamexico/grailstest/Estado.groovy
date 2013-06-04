package org.javamexico.grailstest

class Estado {

   	String nombre
	Pais pais
	Integer poblacion
	static hasMany = [estados:Estado]	

    static constraints = {
	nombre(blank: true)
	pais(nullable: true)
	poblacion(blank: true)
    }

}
