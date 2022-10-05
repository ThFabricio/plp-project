require "application_system_test_case"

class TarefasTest < ApplicationSystemTestCase
  setup do
    @tarefa = tarefas(:one)
  end

  test "visiting the index" do
    visit tarefas_url
    assert_selector "h1", text: "Tarefas"
  end

  test "should create tarefa" do
    visit tarefas_url
    click_on "New tarefa"

    fill_in "Descricao", with: @tarefa.descricao
    fill_in "Horafim", with: @tarefa.horaFim
    fill_in "Horainicio", with: @tarefa.horaInicio
    fill_in "Nome", with: @tarefa.nome
    check "Status" if @tarefa.status
    click_on "Create Tarefa"

    assert_text "Tarefa was successfully created"
    click_on "Back"
  end

  test "should update Tarefa" do
    visit tarefa_url(@tarefa)
    click_on "Edit this tarefa", match: :first

    fill_in "Descricao", with: @tarefa.descricao
    fill_in "Horafim", with: @tarefa.horaFim
    fill_in "Horainicio", with: @tarefa.horaInicio
    fill_in "Nome", with: @tarefa.nome
    check "Status" if @tarefa.status
    click_on "Update Tarefa"

    assert_text "Tarefa was successfully updated"
    click_on "Back"
  end

  test "should destroy Tarefa" do
    visit tarefa_url(@tarefa)
    click_on "Destroy this tarefa", match: :first

    assert_text "Tarefa was successfully destroyed"
  end
end
