package org.javamexico.grailstest



import org.junit.*
import grails.test.mixin.*

@TestFor(CadenaController)
@Mock(Cadena)
class CadenaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cadena/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cadenaInstanceList.size() == 0
        assert model.cadenaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cadenaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cadenaInstance != null
        assert view == '/cadena/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cadena/show/1'
        assert controller.flash.message != null
        assert Cadena.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cadena/list'

        populateValidParams(params)
        def cadena = new Cadena(params)

        assert cadena.save() != null

        params.id = cadena.id

        def model = controller.show()

        assert model.cadenaInstance == cadena
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cadena/list'

        populateValidParams(params)
        def cadena = new Cadena(params)

        assert cadena.save() != null

        params.id = cadena.id

        def model = controller.edit()

        assert model.cadenaInstance == cadena
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cadena/list'

        response.reset()

        populateValidParams(params)
        def cadena = new Cadena(params)

        assert cadena.save() != null

        // test invalid parameters in update
        params.id = cadena.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cadena/edit"
        assert model.cadenaInstance != null

        cadena.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cadena/show/$cadena.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cadena.clearErrors()

        populateValidParams(params)
        params.id = cadena.id
        params.version = -1
        controller.update()

        assert view == "/cadena/edit"
        assert model.cadenaInstance != null
        assert model.cadenaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cadena/list'

        response.reset()

        populateValidParams(params)
        def cadena = new Cadena(params)

        assert cadena.save() != null
        assert Cadena.count() == 1

        params.id = cadena.id

        controller.delete()

        assert Cadena.count() == 0
        assert Cadena.get(cadena.id) == null
        assert response.redirectedUrl == '/cadena/list'
    }
}
