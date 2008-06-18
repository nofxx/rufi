require 'test_helper'

class ApsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:aps)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_ap
    assert_difference('Ap.count') do
      post :create, :ap => { }
    end

    assert_redirected_to ap_path(assigns(:ap))
  end

  def test_should_show_ap
    get :show, :id => aps(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => aps(:one).id
    assert_response :success
  end

  def test_should_update_ap
    put :update, :id => aps(:one).id, :ap => { }
    assert_redirected_to ap_path(assigns(:ap))
  end

  def test_should_destroy_ap
    assert_difference('Ap.count', -1) do
      delete :destroy, :id => aps(:one).id
    end

    assert_redirected_to aps_path
  end
end
