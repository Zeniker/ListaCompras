require "application_system_test_case"

class UnidadeMedidasTest < ApplicationSystemTestCase
  setup do
    @unidade_medida = unidade_medidas(:one)
  end

  test "visiting the index" do
    visit unidade_medidas_url
    assert_selector "h1", text: "Unidade Medidas"
  end

  test "creating a Unidade medida" do
    visit unidade_medidas_url
    click_on "New Unidade Medida"

    fill_in "Nome", with: @unidade_medida.nome
    click_on "Create Unidade medida"

    assert_text "Unidade medida was successfully created"
    click_on "Back"
  end

  test "updating a Unidade medida" do
    visit unidade_medidas_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @unidade_medida.nome
    click_on "Update Unidade medida"

    assert_text "Unidade medida was successfully updated"
    click_on "Back"
  end

  test "destroying a Unidade medida" do
    visit unidade_medidas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unidade medida was successfully destroyed"
  end
end
