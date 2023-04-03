require "test_helper"

class ElevesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elefe = eleves(:one)
  end

  test "should get index" do
    get eleves_url
    assert_response :success
  end

  test "should get new" do
    get new_elefe_url
    assert_response :success
  end

  test "should create elefe" do
    assert_difference("Eleve.count") do
      post eleves_url, params: { elefe: {  } }
    end

    assert_redirected_to elefe_url(Eleve.last)
  end

  test "should show elefe" do
    get elefe_url(@elefe)
    assert_response :success
  end

  test "should get edit" do
    get edit_elefe_url(@elefe)
    assert_response :success
  end

  test "should update elefe" do
    patch elefe_url(@elefe), params: { elefe: {  } }
    assert_redirected_to elefe_url(@elefe)
  end

  test "should destroy elefe" do
    assert_difference("Eleve.count", -1) do
      delete elefe_url(@elefe)
    end

    assert_redirected_to eleves_url
  end
end
