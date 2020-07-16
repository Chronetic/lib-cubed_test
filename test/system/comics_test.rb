require "application_system_test_case"

class ComicsTest < ApplicationSystemTestCase
  setup do
    @comic = comics(:one)
  end

  test "visiting the index" do
    visit comics_url
    assert_selector "h1", text: "Comics"
  end

  test "creating a Comic" do
    visit comics_url
    click_on "New Comic"

    fill_in "Artist", with: @comic.artist
    fill_in "Author", with: @comic.author
    fill_in "Description", with: @comic.description
    fill_in "Title", with: @comic.title
    fill_in "User", with: @comic.user_id
    click_on "Create Comic"

    assert_text "Comic was successfully created"
    click_on "Back"
  end

  test "updating a Comic" do
    visit comics_url
    click_on "Edit", match: :first

    fill_in "Artist", with: @comic.artist
    fill_in "Author", with: @comic.author
    fill_in "Description", with: @comic.description
    fill_in "Title", with: @comic.title
    fill_in "User", with: @comic.user_id
    click_on "Update Comic"

    assert_text "Comic was successfully updated"
    click_on "Back"
  end

  test "destroying a Comic" do
    visit comics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comic was successfully destroyed"
  end
end
