require 'test_helper'

class ProdutosControllerTest < ActionDispatch::IntegrationTest
  include ProdutoHelper

  setup do
    @produto = produtos(:one)
    sign_in_as_default
  end

  test "should get index" do
    get produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_produto_url
    assert_response :success
  end

  test "should create produto" do
    assert_difference('Produto.count') do
      post produtos_url, params: create_params_produto(@produto)
    end

    assert_redirected_to produto_url(Produto.last)
  end

  test "should get edit" do
    get edit_produto_url(@produto)
    assert_response :success
  end

  test "should update produto" do
    patch produto_url(@produto), params: create_params_produto(@produto)
    assert_redirected_to produto_url(@produto)
  end

  test "should get confirm_delete" do
    create_new_produto.save
    produto = Produto.last
    get confirm_delete_produto_url(produto)

    assert_response :success
  end

  test "should not get confirm_delete" do
    get confirm_delete_produto_url(@produto)

    assert_redirected_to produtos_url
  end

  test "should destroy produto" do
    create_new_produto.save
    produto = Produto.last
    assert_difference('Produto.count', -1) do
      delete produto_url(produto)
    end

    assert_redirected_to produtos_url
  end

  test "should not destroy produto" do
    assert_no_difference('Produto.count', -1) do
      delete produto_url(@produto)
    end

    assert_redirected_to produtos_url
  end
end