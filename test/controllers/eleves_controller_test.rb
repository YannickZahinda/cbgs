require "test_helper"

class ElevesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eleve = eleves(:one)
  end

  test "should get index" do
    get eleves_url
    assert_response :success
  end

  test "should get new" do
    get new_eleve_url
    assert_response :success
  end

  test "should create eleve" do
    assert_difference("Eleve.count") do
      post eleves_url, params: { eleve: {  } }
    end

    assert_redirected_to eleve_url(Eleve.last)
  end

  test "should show eleve" do
    get eleve_url(@eleve)
    assert_response :success
  end

  test "should get edit" do
    get edit_eleve_url(@eleve)
    assert_response :success
  end

  test "should update eleve" do
    patch eleve_url(@eleve), params: { eleve: {  } }
    assert_redirected_to eleve_url(@eleve)
  end

  test "should destroy eleve" do
    assert_difference("Eleve.count", -1) do
      delete eleve_url(@eleve)
    end

    assert_redirected_to eleves_url
  end
end
