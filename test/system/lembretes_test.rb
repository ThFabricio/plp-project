require "application_system_test_case"

class LembretesTest < ApplicationSystemTestCase
  setup do
    @lembrete = lembretes(:one)
  end

  test "visiting the index" do
    visit lembretes_url
    assert_selector "h1", text: "Lembretes"
  end

  test "should create lembrete" do
    visit lembretes_url
    click_on "New lembrete"

    fill_in "Descricao", with: @lembrete.descricao
    fill_in "Dia", with: @lembrete.dia
    fill_in "Nome", with: @lembrete.nome
    click_on "Create Lembrete"

    assert_text "Lembrete was successfully created"
    click_on "Back"
  end

  test "should update Lembrete" do
    visit lembrete_url(@lembrete)
    click_on "Edit this lembrete", match: :first

    fill_in "Descricao", with: @lembrete.descricao
    fill_in "Dia", with: @lembrete.dia
    fill_in "Nome", with: @lembrete.nome
    click_on "Update Lembrete"

    assert_text "Lembrete was successfully updated"
    click_on "Back"
  end

  test "should destroy Lembrete" do
    visit lembrete_url(@lembrete)
    click_on "Destroy this lembrete", match: :first

    assert_text "Lembrete was successfully destroyed"
  end
end
