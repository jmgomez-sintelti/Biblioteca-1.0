package biblioteca

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class PrestamoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['ROLE_ADMIN'])
    def index() {
        redirect(action: "list", params: params)
    }
	@Secured(['ROLE_ADMIN'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [prestamoInstanceList: Prestamo.list(params), prestamoInstanceTotal: Prestamo.count()]
    }
	@Secured(['ROLE_ADMIN'])
	def prestamoService
	
	@Secured(['ROLE_ADMIN'])
    def create() {
        def instancia = new Prestamo(params)
		
		def lista = prestamoService.lista(params) 
		[lista:lista,prestamoInstance: new Prestamo(params)]
    }

	
	@Secured(['ROLE_ADMIN'])
    def save() {
		def prestamoInstance = new Prestamo(params)
		
		prestamoService.estado(prestamoInstance)		
		
		
        		
		
        if (!prestamoInstance.save(flush: true)) {
            render(view: "create", model: [prestamoInstance: prestamoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), prestamoInstance.id])
        redirect(action: "show", id: prestamoInstance.id)
    }
	@Secured(['ROLE_ADMIN'])
    def show(Long id) {
        def prestamoInstance = Prestamo.get(id)
        if (!prestamoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), id])
            redirect(action: "list")
            return
        }

        [prestamoInstance: prestamoInstance]
    }
	@Secured(['ROLE_ADMIN'])
    def edit(Long id) {
		def prestamoInstance = Prestamo.get(id)
		
		
        def lista = prestamoService.listaEdit(prestamoInstance)
        if (!prestamoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), id])
            redirect(action: "list")
            return
        }
		
        [lista: lista, prestamoInstance: prestamoInstance]
    }
	@Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
		
        def prestamoInstance = Prestamo.get(id)
		prestamoService.estadoUpdate(prestamoInstance)
		
        if (!prestamoInstance) {
			
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), id])
            redirect(action: "list")
            return
        }

		 def lista = prestamoService.lista(params)
        if (version != null) {
            if (prestamoInstance.version > version) {
                prestamoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prestamo.label', default: 'Prestamo')] as Object[],
                          "Another user has updated this Prestamo while you were editing")
                render(view: "edit", model: [prestamoInstance: prestamoInstance,lista:lista])
                return
            }
        }
		
        prestamoInstance.properties = params
		println "actualizado"
		prestamoService.estadoFalse(prestamoInstance)
       
        if (!prestamoInstance.save(flush: true)) {
            render(view: "edit", model: [prestamoInstance: prestamoInstance,lista:lista])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), prestamoInstance.id])
        redirect(action: "show", id: prestamoInstance.id)
		
    }
	@Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def prestamoInstance = Prestamo.get(id)
        if (!prestamoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), id])
            redirect(action: "list")
            return
        }

        try {
            prestamoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), id])
            redirect(action: "show", id: id)
        }
    }
}
