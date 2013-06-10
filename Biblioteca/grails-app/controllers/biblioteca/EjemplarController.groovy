package biblioteca

import org.springframework.dao.DataIntegrityViolationException

class EjemplarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ejemplarInstanceList: Ejemplar.list(params), ejemplarInstanceTotal: Ejemplar.count()]
    }

    def create() {
        [ejemplarInstance: new Ejemplar(params)]
    }

    def save() {
        def ejemplarInstance = new Ejemplar(params)
        if (!ejemplarInstance.save(flush: true)) {
            render(view: "create", model: [ejemplarInstance: ejemplarInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ejemplar.label', default: 'Ejemplar'), ejemplarInstance.id])
        redirect(action: "show", id: ejemplarInstance.id)
    }

    def show(Long id) {
        def ejemplarInstance = Ejemplar.get(id)
        if (!ejemplarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ejemplar.label', default: 'Ejemplar'), id])
            redirect(action: "list")
            return
        }

        [ejemplarInstance: ejemplarInstance]
    }

    def edit(Long id) {
        def ejemplarInstance = Ejemplar.get(id)
        if (!ejemplarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ejemplar.label', default: 'Ejemplar'), id])
            redirect(action: "list")
            return
        }

        [ejemplarInstance: ejemplarInstance]
    }

    def update(Long id, Long version) {
        def ejemplarInstance = Ejemplar.get(id)
        if (!ejemplarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ejemplar.label', default: 'Ejemplar'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ejemplarInstance.version > version) {
                ejemplarInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ejemplar.label', default: 'Ejemplar')] as Object[],
                          "Another user has updated this Ejemplar while you were editing")
                render(view: "edit", model: [ejemplarInstance: ejemplarInstance])
                return
            }
        }

        ejemplarInstance.properties = params

        if (!ejemplarInstance.save(flush: true)) {
            render(view: "edit", model: [ejemplarInstance: ejemplarInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ejemplar.label', default: 'Ejemplar'), ejemplarInstance.id])
        redirect(action: "show", id: ejemplarInstance.id)
    }

    def delete(Long id) {
        def ejemplarInstance = Ejemplar.get(id)
        if (!ejemplarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ejemplar.label', default: 'Ejemplar'), id])
            redirect(action: "list")
            return
        }

        try {
            ejemplarInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ejemplar.label', default: 'Ejemplar'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ejemplar.label', default: 'Ejemplar'), id])
            redirect(action: "show", id: id)
        }
    }
}
