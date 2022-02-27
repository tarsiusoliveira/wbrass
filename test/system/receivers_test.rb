require "application_system_test_case"

class ReceiversTest < ApplicationSystemTestCase
  setup do
    @receiver = receivers(:one)
  end

  test "visiting the index" do
    visit receivers_url
    assert_selector "h1", text: "Receivers"
  end

  test "creating a Receiver" do
    visit receivers_url
    click_on "New Receiver"

    fill_in "Name", with: @receiver.name
    fill_in "Reception ray", with: @receiver.reception_ray
    fill_in "Rotation", with: @receiver.rotation
    fill_in "X", with: @receiver.x
    fill_in "Y", with: @receiver.y
    fill_in "Z", with: @receiver.z
    click_on "Create Receiver"

    assert_text "Receiver was successfully created"
    click_on "Back"
  end

  test "updating a Receiver" do
    visit receivers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @receiver.name
    fill_in "Reception ray", with: @receiver.reception_ray
    fill_in "Rotation", with: @receiver.rotation
    fill_in "X", with: @receiver.x
    fill_in "Y", with: @receiver.y
    fill_in "Z", with: @receiver.z
    click_on "Update Receiver"

    assert_text "Receiver was successfully updated"
    click_on "Back"
  end

  test "destroying a Receiver" do
    visit receivers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receiver was successfully destroyed"
  end
end
