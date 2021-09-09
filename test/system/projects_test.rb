require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Artificialtail", with: @project.artificialTail
    fill_in "Auralization", with: @project.auralization
    fill_in "Clusterorder", with: @project.clusterOrder
    fill_in "Diffuseprocessing", with: @project.diffuseProcessing
    fill_in "Energydecay", with: @project.energyDecay
    fill_in "Humidity", with: @project.humidity
    fill_in "Idduration", with: @project.idDuration
    fill_in "Maxreflections", with: @project.maxReflections
    fill_in "Numrays", with: @project.numRays
    fill_in "Pressure", with: @project.pressure
    fill_in "Samplerate", with: @project.sampleRate
    fill_in "Savediffuserays", with: @project.saveDiffuseRays
    fill_in "Savelaterays", with: @project.saveLateRays
    fill_in "Temperature", with: @project.temperature
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "Artificialtail", with: @project.artificialTail
    fill_in "Auralization", with: @project.auralization
    fill_in "Clusterorder", with: @project.clusterOrder
    fill_in "Diffuseprocessing", with: @project.diffuseProcessing
    fill_in "Energydecay", with: @project.energyDecay
    fill_in "Humidity", with: @project.humidity
    fill_in "Idduration", with: @project.idDuration
    fill_in "Maxreflections", with: @project.maxReflections
    fill_in "Numrays", with: @project.numRays
    fill_in "Pressure", with: @project.pressure
    fill_in "Samplerate", with: @project.sampleRate
    fill_in "Savediffuserays", with: @project.saveDiffuseRays
    fill_in "Savelaterays", with: @project.saveLateRays
    fill_in "Temperature", with: @project.temperature
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
