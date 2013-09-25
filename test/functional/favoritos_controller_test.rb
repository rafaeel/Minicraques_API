require 'test_helper'

class FavoritosControllerTest < ActionController::TestCase
  setup do
    @favorito = favoritos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favoritos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorito" do
    assert_difference('Favorito.count') do
      post :create, favorito: { name: @favorito.name, nationality: @favorito.nationality, photo_url: @favorito.photo_url }
    end

    assert_redirected_to favorito_path(assigns(:favorito))
  end

  test "should show favorito" do
    get :show, id: @favorito
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorito
    assert_response :success
  end

  test "should update favorito" do
    put :update, id: @favorito, favorito: { name: @favorito.name, nationality: @favorito.nationality, photo_url: @favorito.photo_url }
    assert_redirected_to favorito_path(assigns(:favorito))
  end

  test "should destroy favorito" do
    assert_difference('Favorito.count', -1) do
      delete :destroy, id: @favorito
    end

    assert_redirected_to favoritos_path
  end
end
