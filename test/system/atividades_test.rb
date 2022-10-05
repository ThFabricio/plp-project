require "application_system_test_case"

class AtividadesTest < ApplicationSystemTestCase
  setup do
    @atividade = atividades(:one)
  end

  test "visiting the index" do
    visit atividades_url
    assert_selector "h1", text: "Atividades"
  end

  test "should create atividade" do
    visit atividades_url
    click_on "New atividade"

    fill_in "Descricao", with: @atividade.descricao
    fill_in "End time", with: @atividade.end_time
    fill_in "Nome", with: @atividade.nome
    fill_in "Start time", with: @atividade.start_time
    click_on "Create Atividade"

    assert_text "Atividade was successfully created"
    click_on "Back"
  end

  test "should update Atividade" do
    visit atividade_url(@atividade)
    click_on "Edit this atividade", match: :first

    fill_in "Descricao", with: @atividade.descricao
    fill_in "End time", with: @atividade.end_time
    fill_in "Nome", with: @atividade.nome
    fill_in "Start time", with: @atividade.start_time
    click_on "Update Atividade"

    assert_text "Atividade was successfully updated"
    click_on "Back"
  end

  test "should destroy Atividade" do
    visit atividade_url(@atividade)
    click_on "Destroy this atividade", match: :first

    assert_text "Atividade was successfully destroyed"
  end
end
