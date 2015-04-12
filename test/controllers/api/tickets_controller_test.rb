require 'test_helper'

class Api::TicketsControllerTest < ActionController::TestCase
  test "should get band" do
    get :band
    assert_response :success
  end

  test "should get dj" do
    get :dj
    assert_response :success
  end

  test "should get both" do
    get :both
    assert_response :success
  end

end
