require "application_system_test_case"

class ElevesTest < ApplicationSystemTestCase
  setup do
    @eleve = eleves(:one)
  end

  test "visiting the index" do
    visit eleves_url
    assert_selector "h1", text: "Eleves"
  end

  test "should create eleve" do
    visit eleves_url
    click_on "New eleve"

    click_on "Create Eleve"

    assert_text "Eleve was successfully created"
    click_on "Back"
  end

  test "should update Eleve" do
    visit eleve_url(@eleve)
    click_on "Edit this eleve", match: :first

    click_on "Update Eleve"

    assert_text "Eleve was successfully updated"
    click_on "Back"
  end

  test "should destroy Eleve" do
    visit eleve_url(@eleve)
    click_on "Destroy this eleve", match: :first

    assert_text "Eleve was successfully destroyed"
  end
end
