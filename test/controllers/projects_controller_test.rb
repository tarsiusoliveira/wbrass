require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { artificialTail: @project.artificialTail, auralization: @project.auralization, clusterOrder: @project.clusterOrder, diffuseProcessing: @project.diffuseProcessing, energyDecay: @project.energyDecay, humidity: @project.humidity, idDuration: @project.idDuration, maxReflections: @project.maxReflections, numRays: @project.numRays, pressure: @project.pressure, sampleRate: @project.sampleRate, saveDiffuseRays: @project.saveDiffuseRays, saveLateRays: @project.saveLateRays, temperature: @project.temperature } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { artificialTail: @project.artificialTail, auralization: @project.auralization, clusterOrder: @project.clusterOrder, diffuseProcessing: @project.diffuseProcessing, energyDecay: @project.energyDecay, humidity: @project.humidity, idDuration: @project.idDuration, maxReflections: @project.maxReflections, numRays: @project.numRays, pressure: @project.pressure, sampleRate: @project.sampleRate, saveDiffuseRays: @project.saveDiffuseRays, saveLateRays: @project.saveLateRays, temperature: @project.temperature } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
