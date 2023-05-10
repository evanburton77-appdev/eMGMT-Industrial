require "test_helper"

class GptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gpt = gpts(:one)
  end

  test "should get index" do
    get gpts_url
    assert_response :success
  end

  test "should get new" do
    get new_gpt_url
    assert_response :success
  end

  test "should create gpt" do
    assert_difference('Gpt.count') do
      post gpts_url, params: { gpt: { content: @gpt.content, role: @gpt.role, user_id: @gpt.user_id } }
    end

    assert_redirected_to gpt_url(Gpt.last)
  end

  test "should show gpt" do
    get gpt_url(@gpt)
    assert_response :success
  end

  test "should get edit" do
    get edit_gpt_url(@gpt)
    assert_response :success
  end

  test "should update gpt" do
    patch gpt_url(@gpt), params: { gpt: { content: @gpt.content, role: @gpt.role, user_id: @gpt.user_id } }
    assert_redirected_to gpt_url(@gpt)
  end

  test "should destroy gpt" do
    assert_difference('Gpt.count', -1) do
      delete gpt_url(@gpt)
    end

    assert_redirected_to gpts_url
  end
end
