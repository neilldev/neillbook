require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:test).profileName
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 if profile not found" do
  	get :show, id: "does not exist"
  	assert_response :not_found
  end

  test "that instance variables are correctly showing when viewing profiles" do
  get :show, id: users(:test).profileName
  assert assigns(:user)
  assert_not_empty assigns(:statuses)
  end

  test "only shows the correct user statuses" do
  get :show, id: users(:test).profileName
    assigns(:statuses).each do |status|
    assert_equal users(:test), status.user
  end
  end

end
