package org.javamexico.grailstest

class Cadena {

	String cadenaRecibida
	
    static constraints = {
		cadenaRecibida(blank: false)	
    }
}
