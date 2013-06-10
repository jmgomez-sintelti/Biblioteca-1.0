package biblioteca



import org.junit.*
import grails.test.mixin.*

@TestFor(EditorialController)
@Mock(Editorial)
class EditorialControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/editorial/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.editorialInstanceList.size() == 0
        assert model.editorialInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.editorialInstance != null
    }

    void testSave() {
        controller.save()

        assert model.editorialInstance != null
        assert view == '/editorial/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/editorial/show/1'
        assert controller.flash.message != null
        assert Editorial.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/editorial/list'

        populateValidParams(params)
        def editorial = new Editorial(params)

        assert editorial.save() != null

        params.id = editorial.id

        def model = controller.show()

        assert model.editorialInstance == editorial
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/editorial/list'

        populateValidParams(params)
        def editorial = new Editorial(params)

        assert editorial.save() != null

        params.id = editorial.id

        def model = controller.edit()

        assert model.editorialInstance == editorial
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/editorial/list'

        response.reset()

        populateValidParams(params)
        def editorial = new Editorial(params)

        assert editorial.save() != null

        // test invalid parameters in update
        params.id = editorial.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/editorial/edit"
        assert model.editorialInstance != null

        editorial.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/editorial/show/$editorial.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        editorial.clearErrors()

        populateValidParams(params)
        params.id = editorial.id
        params.version = -1
        controller.update()

        assert view == "/editorial/edit"
        assert model.editorialInstance != null
        assert model.editorialInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/editorial/list'

        response.reset()

        populateValidParams(params)
        def editorial = new Editorial(params)

        assert editorial.save() != null
        assert Editorial.count() == 1

        params.id = editorial.id

        controller.delete()

        assert Editorial.count() == 0
        assert Editorial.get(editorial.id) == null
        assert response.redirectedUrl == '/editorial/list'
    }
}
