require 'test_helper'

class EventPagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => EventPage.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    EventPage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    EventPage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to event_page_url(assigns(:event_page))
  end

  def test_edit
    get :edit, :id => EventPage.first
    assert_template 'edit'
  end

  def test_update_invalid
    EventPage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => EventPage.first
    assert_template 'edit'
  end

  def test_update_valid
    EventPage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => EventPage.first
    assert_redirected_to event_page_url(assigns(:event_page))
  end

  def test_destroy
    event_page = EventPage.first
    delete :destroy, :id => event_page
    assert_redirected_to event_pages_url
    assert !EventPage.exists?(event_page.id)
  end
end
