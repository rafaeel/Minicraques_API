require 'test_helper'

class CraquesControllerTest < ActionController::TestCase
  setup do
    @craque = craques(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:craques)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create craque" do
    assert_difference('Craque.count') do
      post :create, craque: { name: @craque.name, nationality: @craque.nationality }
    end

    assert_redirected_to craque_path(assigns(:craque))
  end

  test "should show craque" do
    get :show, id: @craque
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @craque
    assert_response :success
  end

  test "should update craque" do
    put :update, id: @craque, craque: { name: @craque.name, nationality: @craque.nationality }
    assert_redirected_to craque_path(assigns(:craque))
  end

  test "should destroy craque" do
    assert_difference('Craque.count', -1) do
      delete :destroy, id: @craque
    end

    assert_redirected_to craques_path
  end
end
