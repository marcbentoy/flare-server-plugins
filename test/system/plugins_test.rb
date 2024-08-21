require "application_system_test_case"

class PluginsTest < ApplicationSystemTestCase
  setup do
    @plugin = plugins(:one)
  end

  test "visiting the index" do
    visit plugins_url
    assert_selector "h1", text: "Plugins"
  end

  test "should create plugin" do
    visit plugins_url
    click_on "New plugin"

    fill_in "Description", with: @plugin.description
    fill_in "Major", with: @plugin.major
    fill_in "Minor", with: @plugin.minor
    fill_in "Name", with: @plugin.name
    fill_in "Patch", with: @plugin.patch
    check "Published" if @plugin.published
    fill_in "Status", with: @plugin.status
    click_on "Create Plugin"

    assert_text "Plugin was successfully created"
    click_on "Back"
  end

  test "should update Plugin" do
    visit plugin_url(@plugin)
    click_on "Edit this plugin", match: :first

    fill_in "Description", with: @plugin.description
    fill_in "Major", with: @plugin.major
    fill_in "Minor", with: @plugin.minor
    fill_in "Name", with: @plugin.name
    fill_in "Patch", with: @plugin.patch
    check "Published" if @plugin.published
    fill_in "Status", with: @plugin.status
    click_on "Update Plugin"

    assert_text "Plugin was successfully updated"
    click_on "Back"
  end

  test "should destroy Plugin" do
    visit plugin_url(@plugin)
    click_on "Destroy this plugin", match: :first

    assert_text "Plugin was successfully destroyed"
  end
end
