require "test_helper"

class LembretesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lembrete = lembretes(:one)
  end

  test "should get index" do
    get lembretes_url
    assert_response :success
  end

  test "should get new" do
    get new_lembrete_url
    assert_response :success
  end

  test "should create lembrete" do
    assert_difference("Lembrete.count") do
      post lembretes_url, params: { lembrete: { descricao: @lembrete.descricao, dia: @lembrete.dia, nome: @lembrete.nome } }
    end

    assert_redirected_to lembrete_url(Lembrete.last)
  end

  test "should show lembrete" do
    get lembrete_url(@lembrete)
    assert_response :success
  end

  test "should get edit" do
    get edit_lembrete_url(@lembrete)
    assert_response :success
  end

  test "should update lembrete" do
    patch lembrete_url(@lembrete), params: { lembrete: { descricao: @lembrete.descricao, dia: @lembrete.dia, nome: @lembrete.nome } }
    assert_redirected_to lembrete_url(@lembrete)
  end

  test "should destroy lembrete" do
    assert_difference("Lembrete.count", -1) do
      delete lembrete_url(@lembrete)
    end

    assert_redirected_to lembretes_url
  end
end
