package biblioteca

import org.springframework.dao.DataIntegrityViolationException

class EditorialController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [editorialInstanceList: Editorial.list(params), editorialInstanceTotal: Editorial.count()]
    }

    def create() {
        [editorialInstance: new Editorial(params)]
    }

    def save() {
        def editorialInstance = new Editorial(params)
        if (!editorialInstance.save(flush: true)) {
            render(view: "create", model: [editorialInstance: editorialInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'editorial.label', default: 'Editorial'), editorialInstance.id])
        redirect(action: "show", id: editorialInstance.id)
    }

    def show(Long id) {
        def editorialInstance = Editorial.get(id)
        if (!editorialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'editorial.label', default: 'Editorial'), id])
            redirect(action: "list")
            return
        }

        [editorialInstance: editorialInstance]
    }

    def edit(Long id) {
        def editorialInstance = Editorial.get(id)
        if (!editorialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'editorial.label', default: 'Editorial'), id])
            redirect(action: "list")
            return
        }

        [editorialInstance: editorialInstance]
    }

    def update(Long id, Long version) {
        def editorialInstance = Editorial.get(id)
        if (!editorialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'editorial.label', default: 'Editorial'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (editorialInstance.version > version) {
                editorialInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'editorial.label', default: 'Editorial')] as Object[],
                          "Another user has updated this Editorial while you were editing")
                render(view: "edit", model: [editorialInstance: editorialInstance])
                return
            }
        }

        editorialInstance.properties = params

        if (!editorialInstance.save(flush: true)) {
            render(view: "edit", model: [editorialInstance: editorialInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'editorial.label', default: 'Editorial'), editorialInstance.id])
        redirect(action: "show", id: editorialInstance.id)
    }

    def delete(Long id) {
        def editorialInstance = Editorial.get(id)
        if (!editorialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'editorial.label', default: 'Editorial'), id])
            redirect(action: "list")
            return
        }

        try {
            editorialInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'editorial.label', default: 'Editorial'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'editorial.label', default: 'Editorial'), id])
            redirect(action: "show", id: id)
        }
    }
}
