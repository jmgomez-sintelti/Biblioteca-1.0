package org.javamexico.grailstest

import org.springframework.dao.DataIntegrityViolationException

class PaisController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [paisInstanceList: Pais.list(params), paisInstanceTotal: Pais.count()]
    }

    def create() {
        [paisInstance: new Pais(params)]
    }

    def save() {
        def paisInstance = new Pais(params)
        if (!paisInstance.save(flush: true)) {
            render(view: "create", model: [paisInstance: paisInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pais.label', default: 'Pais'), paisInstance.id])
        redirect(action: "show", id: paisInstance.id)
    }

    def show(Long id) {
        def paisInstance = Pais.get(id)
        if (!paisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "list")
            return
        }

        [paisInstance: paisInstance]
    }

    def edit(Long id) {
        def paisInstance = Pais.get(id)
        if (!paisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "list")
            return
        }

        [paisInstance: paisInstance]
    }

    def update(Long id, Long version) {
        def paisInstance = Pais.get(id)
        if (!paisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (paisInstance.version > version) {
                paisInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pais.label', default: 'Pais')] as Object[],
                          "Another user has updated this Pais while you were editing")
                render(view: "edit", model: [paisInstance: paisInstance])
                return
            }
        }

        paisInstance.properties = params

        if (!paisInstance.save(flush: true)) {
            render(view: "edit", model: [paisInstance: paisInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pais.label', default: 'Pais'), paisInstance.id])
        redirect(action: "show", id: paisInstance.id)
    }

    def delete(Long id) {
        def paisInstance = Pais.get(id)
        if (!paisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "list")
            return
        }

        try {
            paisInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "show", id: id)
        }
    }
}
