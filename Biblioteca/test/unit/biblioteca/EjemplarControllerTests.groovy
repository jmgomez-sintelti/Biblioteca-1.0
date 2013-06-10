package biblioteca



import org.junit.*
import grails.test.mixin.*

@TestFor(EjemplarController)
@Mock(Ejemplar)
class EjemplarControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ejemplar/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ejemplarInstanceList.size() == 0
        assert model.ejemplarInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ejemplarInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ejemplarInstance != null
        assert view == '/ejemplar/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ejemplar/show/1'
        assert controller.flash.message != null
        assert Ejemplar.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ejemplar/list'

        populateValidParams(params)
        def ejemplar = new Ejemplar(params)

        assert ejemplar.save() != null

        params.id = ejemplar.id

        def model = controller.show()

        assert model.ejemplarInstance == ejemplar
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ejemplar/list'

        populateValidParams(params)
        def ejemplar = new Ejemplar(params)

        assert ejemplar.save() != null

        params.id = ejemplar.id

        def model = controller.edit()

        assert model.ejemplarInstance == ejemplar
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ejemplar/list'

        response.reset()

        populateValidParams(params)
        def ejemplar = new Ejemplar(params)

        assert ejemplar.save() != null

        // test invalid parameters in update
        params.id = ejemplar.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ejemplar/edit"
        assert model.ejemplarInstance != null

        ejemplar.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ejemplar/show/$ejemplar.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ejemplar.clearErrors()

        populateValidParams(params)
        params.id = ejemplar.id
        params.version = -1
        controller.update()

        assert view == "/ejemplar/edit"
        assert model.ejemplarInstance != null
        assert model.ejemplarInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ejemplar/list'

        response.reset()

        populateValidParams(params)
        def ejemplar = new Ejemplar(params)

        assert ejemplar.save() != null
        assert Ejemplar.count() == 1

        params.id = ejemplar.id

        controller.delete()

        assert Ejemplar.count() == 0
        assert Ejemplar.get(ejemplar.id) == null
        assert response.redirectedUrl == '/ejemplar/list'
    }
}
