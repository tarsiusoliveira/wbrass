require "application_system_test_case"

class MaterialsTest < ApplicationSystemTestCase
  setup do
    @material = materials(:one)
  end

  test "visiting the index" do
    visit materials_url
    assert_selector "h1", text: "Materials"
  end

  test "creating a Material" do
    visit materials_url
    click_on "New Material"

    fill_in "Freq125hz", with: @material.freq125hz
    fill_in "Freq16k", with: @material.freq16k
    fill_in "Freq1k", with: @material.freq1k
    fill_in "Freq250hz", with: @material.freq250hz
    fill_in "Freq2k", with: @material.freq2k
    fill_in "Freq4k", with: @material.freq4k
    fill_in "Freq500hz", with: @material.freq500hz
    fill_in "freq63hz", with: @material.freq63hz
    fill_in "Freq8k", with: @material.freq8k
    fill_in "Name", with: @material.name
    fill_in "Scattering coefficient", with: @material.scattering_coefficient
    click_on "Create Material"

    assert_text "Material was successfully created"
    click_on "Back"
  end

  test "updating a Material" do
    visit materials_url
    click_on "Edit", match: :first

    fill_in "Freq125hz", with: @material.freq125hz
    fill_in "Freq16k", with: @material.freq16k
    fill_in "Freq1k", with: @material.freq1k
    fill_in "Freq250hz", with: @material.freq250hz
    fill_in "Freq2k", with: @material.freq2k
    fill_in "Freq4k", with: @material.freq4k
    fill_in "Freq500hz", with: @material.freq500hz
    fill_in "freq63hz", with: @material.freq63hz
    fill_in "Freq8k", with: @material.freq8k
    fill_in "Name", with: @material.name
    fill_in "Scattering coefficient", with: @material.scattering_coefficient
    click_on "Update Material"

    assert_text "Material was successfully updated"
    click_on "Back"
  end

  test "destroying a Material" do
    visit materials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Material was successfully destroyed"
  end
end
