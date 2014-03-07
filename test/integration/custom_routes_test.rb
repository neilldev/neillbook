require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
 	test "the register link opens the sign up page" do
 		get '/register'
        assert_response :success
    end

    test "the login link opens the sign in page" do
 		get '/login'
        assert_response :success
    end

    test "the feed link opens the status index page" do
 		get '/feed'
        assert_response :success        
    end

    test "the update link opens the new status page" do
 		get '/update'
        assert_response :redirect
        assert_redirected_to '/users/sign_in'
    end

#    test "the logout link logs us out" do
# 		get '/logout'
#        assert_response :redirect
#        assert_redirected_to '/'
#    end

    test "can render profile page" do
        get '/Jedi'
        assert_response :success
    end
end
