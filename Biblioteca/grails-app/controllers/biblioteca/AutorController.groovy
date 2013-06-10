package biblioteca

import org.springframework.dao.DataIntegrityViolationException

class AutorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [autorInstanceList: Autor.list(params), autorInstanceTotal: Autor.count()]
    }

    def create() {
        [autorInstance: new Autor(params)]
    }

    def save() {
        def autorInstance = new Autor(params)
        if (!autorInstance.save(flush: true)) {
            render(view: "create", model: [autorInstance: autorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'autor.label', default: 'Autor'), autorInstance.id])
        redirect(action: "show", id: autorInstance.id)
    }

    def show(Long id) {
        def autorInstance = Autor.get(id)
        if (!autorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'autor.label', default: 'Autor'), id])
            redirect(action: "list")
            return
        }

        [autorInstance: autorInstance]
    }

    def edit(Long id) {
        def autorInstance = Autor.get(id)
        if (!autorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'autor.label', default: 'Autor'), id])
            redirect(action: "list")
            return
        }

        [autorInstance: autorInstance]
    }

    def update(Long id, Long version) {
        def autorInstance = Autor.get(id)
        if (!autorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'autor.label', default: 'Autor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (autorInstance.version > version) {
                autorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'autor.label', default: 'Autor')] as Object[],
                          "Another user has updated this Autor while you were editing")
                render(view: "edit", model: [autorInstance: autorInstance])
                return
            }
        }

        autorInstance.properties = params

        if (!autorInstance.save(flush: true)) {
            render(view: "edit", model: [autorInstance: autorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'autor.label', default: 'Autor'), autorInstance.id])
        redirect(action: "show", id: autorInstance.id)
    }

    def delete(Long id) {
        def autorInstance = Autor.get(id)
        if (!autorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'autor.label', default: 'Autor'), id])
            redirect(action: "list")
            return
        }

        try {
            autorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'autor.label', default: 'Autor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'autor.label', default: 'Autor'), id])
            redirect(action: "show", id: id)
        }
    }
}
