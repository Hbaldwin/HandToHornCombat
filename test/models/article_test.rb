require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  
  def setup
    @user = User.create(username: "Hayden", email:"hayden@hayden.com")
    @article = @user.articles.build(title: "First Update News", 
    content: "this whole thing needs to be here so that i can make sure that everything works, i wonder if this is enough characters. probably not so i will just add some more",
    summary: "this is a summary of the things")
  end
  
  test "article should be valid" do
    assert @article.valid?
    
  end
  
  test "user_id should be present" do
    @article.user_id = nil
    assert_not @article.valid?
  end
  
  test "name should be present" do
    @article.title = " "
    assert_not @article.valid?
  end
  
  test "title should not be too long" do
    @article.title = "a" * 101
    assert_not @article.valid?
  end
  
  test "title should not be too short" do
    @article.title = "a" * 4
    assert_not @article.valid?
  end
  
  test "content should be present" do
    @article.content = " "
    assert_not @article.valid?
  end
  
  test "content length should not be too long" do
    @article.content = "a" * 1001
    assert_not @article.valid?
  end
  
  test "content length should not be too short" do
    @article.content = "a" * 49
    assert_not @article.valid?
  end
  
  test "summary should be present" do
    @article.summary = " "
    assert_not @article.valid?
  end
  
  test "summary should not be too long" do
    @article.summary = "a" * 41
    assert_not @article.valid?
  end
  
  test "summary should not be too short" do
    @article.summary = "a" * 9
    assert_not @article.valid?
  end
  
  
  
end