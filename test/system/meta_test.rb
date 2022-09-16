require "application_system_test_case"

class MetaTest < ApplicationSystemTestCase
  setup do
    @metum = meta(:one)
  end

  test "visiting the index" do
    visit meta_url
    assert_selector "h1", text: "Meta"
  end

  test "should create metum" do
    visit meta_url
    click_on "New metum"

    fill_in "Descricao", with: @metum.descricao
    fill_in "Frequencia", with: @metum.frequencia
    fill_in "Nome", with: @metum.nome
    fill_in "Status", with: @metum.status
    click_on "Create Metum"

    assert_text "Metum was successfully created"
    click_on "Back"
  end

  test "should update Metum" do
    visit metum_url(@metum)
    click_on "Edit this metum", match: :first

    fill_in "Descricao", with: @metum.descricao
    fill_in "Frequencia", with: @metum.frequencia
    fill_in "Nome", with: @metum.nome
    fill_in "Status", with: @metum.status
    click_on "Update Metum"

    assert_text "Metum was successfully updated"
    click_on "Back"
  end

  test "should destroy Metum" do
    visit metum_url(@metum)
    click_on "Destroy this metum", match: :first

    assert_text "Metum was successfully destroyed"
  end
end
