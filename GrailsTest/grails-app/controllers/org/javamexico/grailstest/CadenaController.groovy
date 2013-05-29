package org.javamexico.grailstest

import org.springframework.dao.DataIntegrityViolationException

class CadenaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cadenaInstanceList: Cadena.list(params), cadenaInstanceTotal: Cadena.count()]
    }

    def create() {
        [cadenaInstance: new Cadena(params)]
    }

    def save() {

		String cadena = params.cadenaRecibida
		String remplazo = "x"
		StringBuffer destino = new StringBuffer();
		for(int i = 0; i < cadena.length(); i++){
			
			if(cadena.charAt(i)=="o"){
				destino.append(remplazo)
				remplazo = remplazo + "x"
			}
			else{
				destino.append(cadena.charAt(i))
			}

		}
		params.cadenaRecibida = destino

        def cadenaInstance = new Cadena(params)
        if (!cadenaInstance.save(flush: true)) {
            render(view: "create", model: [cadenaInstance: cadenaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cadena.label', default: 'Cadena'), cadenaInstance.id])
        redirect(action: "show", id: cadenaInstance.id)
    }

    def show(Long id) {
        def cadenaInstance = Cadena.get(id)
        if (!cadenaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadena.label', default: 'Cadena'), id])
            redirect(action: "list")
            return
        }

        [cadenaInstance: cadenaInstance]
    }

    def edit(Long id) {
        def cadenaInstance = Cadena.get(id)
        if (!cadenaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadena.label', default: 'Cadena'), id])
            redirect(action: "list")
            return
        }

        [cadenaInstance: cadenaInstance]
    }

    def update(Long id, Long version) {
        def cadenaInstance = Cadena.get(id)
        if (!cadenaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadena.label', default: 'Cadena'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cadenaInstance.version > version) {
                cadenaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cadena.label', default: 'Cadena')] as Object[],
                          "Another user has updated this Cadena while you were editing")
                render(view: "edit", model: [cadenaInstance: cadenaInstance])
                return
            }
        }

        cadenaInstance.properties = params

        if (!cadenaInstance.save(flush: true)) {
            render(view: "edit", model: [cadenaInstance: cadenaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cadena.label', default: 'Cadena'), cadenaInstance.id])
        redirect(action: "show", id: cadenaInstance.id)
    }

    def delete(Long id) {
        def cadenaInstance = Cadena.get(id)
        if (!cadenaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadena.label', default: 'Cadena'), id])
            redirect(action: "list")
            return
        }

        try {
            cadenaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cadena.label', default: 'Cadena'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cadena.label', default: 'Cadena'), id])
            redirect(action: "show", id: id)
        }
    }
}
