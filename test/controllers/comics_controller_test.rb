require 'test_helper'

class ComicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comic = comics(:one)
  end

  test "should get index" do
    get comics_url
    assert_response :success
  end

  test "should get new" do
    get new_comic_url
    assert_response :success
  end

  test "should create comic" do
    assert_difference('Comic.count') do
      post comics_url, params: { comic: { artist: @comic.artist, author: @comic.author, description: @comic.description, title: @comic.title, user_id: @comic.user_id } }
    end

    assert_redirected_to comic_url(Comic.last)
  end

  test "should show comic" do
    get comic_url(@comic)
    assert_response :success
  end

  test "should get edit" do
    get edit_comic_url(@comic)
    assert_response :success
  end

  test "should update comic" do
    patch comic_url(@comic), params: { comic: { artist: @comic.artist, author: @comic.author, description: @comic.description, title: @comic.title, user_id: @comic.user_id } }
    assert_redirected_to comic_url(@comic)
  end

  test "should destroy comic" do
    assert_difference('Comic.count', -1) do
      delete comic_url(@comic)
    end

    assert_redirected_to comics_url
  end
end
