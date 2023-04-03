require "application_system_test_case"

class CommuniquesTest < ApplicationSystemTestCase
  setup do
    @communique = communiques(:one)
  end

  test "visiting the index" do
    visit communiques_url
    assert_selector "h1", text: "Communiques"
  end

  test "should create communique" do
    visit communiques_url
    click_on "New communique"

    click_on "Create Communique"

    assert_text "Communique was successfully created"
    click_on "Back"
  end

  test "should update Communique" do
    visit communique_url(@communique)
    click_on "Edit this communique", match: :first

    click_on "Update Communique"

    assert_text "Communique was successfully updated"
    click_on "Back"
  end

  test "should destroy Communique" do
    visit communique_url(@communique)
    click_on "Destroy this communique", match: :first

    assert_text "Communique was successfully destroyed"
  end
end
