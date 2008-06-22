require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:cities)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_city
    assert_difference('City.count') do
      post :create, :city => { }
    end

    assert_redirected_to city_path(assigns(:city))
  end

  def test_should_show_city
    get :show, :id => cities(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => cities(:one).id
    assert_response :success
  end

  def test_should_update_city
    put :update, :id => cities(:one).id, :city => { }
    assert_redirected_to city_path(assigns(:city))
  end

  def test_should_destroy_city
    assert_difference('City.count', -1) do
      delete :destroy, :id => cities(:one).id
    end

    assert_redirected_to cities_path
  end
end
