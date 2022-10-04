require "test_helper"

class MetaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metum = meta(:one)
  end

  test "should get index" do
    get meta_url
    assert_response :success
  end

  test "should get new" do
    get new_metum_url
    assert_response :success
  end

  test "should create metum" do
    assert_difference("Metum.count") do
      post meta_url, params: { metum: { descricao: @metum.descricao, frequencia: @metum.frequencia, nome: @metum.nome, status: @metum.status } }
    end

    assert_redirected_to metum_url(Metum.last)
  end

  test "should show metum" do
    get metum_url(@metum)
    assert_response :success
  end

  test "should get edit" do
    get edit_metum_url(@metum)
    assert_response :success
  end

  test "should update metum" do
    patch metum_url(@metum), params: { metum: { descricao: @metum.descricao, frequencia: @metum.frequencia, nome: @metum.nome, status: @metum.status } }
    assert_redirected_to metum_url(@metum)
  end

  test "should destroy metum" do
    assert_difference("Metum.count", -1) do
      delete metum_url(@metum)
    end

    assert_redirected_to meta_url
  end
end
