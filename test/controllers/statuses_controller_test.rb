require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end
#//////////////////////New status//////////////////////////////////////
  test "should be redirected to sign in when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render new status page when logged in" do
    sign_in users(:test)
    get :new
    assert_response :success 
  end

  test "should be logged in to post a status" do
    post :create, status: { content: "Text" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create status when logged in" do
    sign_in users(:test)

    assert_difference('Status.count') do
      post :create, status: { content: @status.content }
    end

    assert_redirected_to status_path(assigns(:status))
  end
#/////////////////New status END/////////////////////////////////////
  test "should show status" do
    get :show, id: @status
    assert_response :success
  end
#//////////////////////Edit status///////////////////////////////////
  test "should render edit update page when logged in" do
    sign_in users(:test)

    get :edit, id: @status
    assert_response :success
  end

  test "should be logged in to edit a status" do
    get :edit, id: @status
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
#//////////////////////Edit status END///////////////////////////////

#//////////////////////Update status/////////////////////////////////
test "should redirect status update when not logged in" do
    put :update, id: @status, status: { content: @status.content }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update status when logged in" do
    sign_in users(:test)
#patch
    put :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end
#//////////////////////Update status END/////////////////////////////

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
