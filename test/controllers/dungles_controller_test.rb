require 'test_helper'

class DunglesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dungle = dungles(:one)
  end

  test "should get index" do
    get dungles_url
    assert_response :success
  end

  test "should get new" do
    get new_dungle_url
    assert_response :success
  end

  test "should create dungle" do
    assert_difference('Dungle.count') do
      post dungles_url, params: { dungle: { ambience: @dungle.ambience, cleanliness: @dungle.cleanliness, description: @dungle.description, performance: @dungle.performance, scent: @dungle.scent, traffic: @dungle.traffic, user_id: @dungle.user_id } }
    end

    assert_redirected_to dungle_url(Dungle.last)
  end

  test "should show dungle" do
    get dungle_url(@dungle)
    assert_response :success
  end

  test "should get edit" do
    get edit_dungle_url(@dungle)
    assert_response :success
  end

  test "should update dungle" do
    patch dungle_url(@dungle), params: { dungle: { ambience: @dungle.ambience, cleanliness: @dungle.cleanliness, description: @dungle.description, performance: @dungle.performance, scent: @dungle.scent, traffic: @dungle.traffic, user_id: @dungle.user_id } }
    assert_redirected_to dungle_url(@dungle)
  end

  test "should destroy dungle" do
    assert_difference('Dungle.count', -1) do
      delete dungle_url(@dungle)
    end

    assert_redirected_to dungles_url
  end
end
