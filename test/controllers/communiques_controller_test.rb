require "test_helper"

class CommuniquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @communique = communiques(:one)
  end

  test "should get index" do
    get communiques_url
    assert_response :success
  end

  test "should get new" do
    get new_communique_url
    assert_response :success
  end

  test "should create communique" do
    assert_difference("Communique.count") do
      post communiques_url, params: { communique: {  } }
    end

    assert_redirected_to communique_url(Communique.last)
  end

  test "should show communique" do
    get communique_url(@communique)
    assert_response :success
  end

  test "should get edit" do
    get edit_communique_url(@communique)
    assert_response :success
  end

  test "should update communique" do
    patch communique_url(@communique), params: { communique: {  } }
    assert_redirected_to communique_url(@communique)
  end

  test "should destroy communique" do
    assert_difference("Communique.count", -1) do
      delete communique_url(@communique)
    end

    assert_redirected_to communiques_url
  end
end
