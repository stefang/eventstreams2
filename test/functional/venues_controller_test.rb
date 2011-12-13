require 'test_helper'

class VenuesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Venue.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Venue.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Venue.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to venue_url(assigns(:venue))
  end

  def test_edit
    get :edit, :id => Venue.first
    assert_template 'edit'
  end

  def test_update_invalid
    Venue.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Venue.first
    assert_template 'edit'
  end

  def test_update_valid
    Venue.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Venue.first
    assert_redirected_to venue_url(assigns(:venue))
  end

  def test_destroy
    venue = Venue.first
    delete :destroy, :id => venue
    assert_redirected_to venues_url
    assert !Venue.exists?(venue.id)
  end
end
