require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "tester", email: "tester@test.com")
  end
  
  test "User should be valid" do
    assert @user.valid?
  end
  
  test "Username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end
  
  test "username should not be too long" do
    @user.username = "a" * 41  
    assert_not @user.valid?
  end
  
  test "username should not be too short" do
    @user.username = "a" * 3
    assert_not @user.valid?
  end
  
  test "email should be present" do 
    @user.email = " "
    assert_not @user.valid?
  end
  
  test "email should be within bounds" do
    @user.email = "a" * 101 + "@example.com"
    assert_not @user.valid?
  end
  
  test "email should be unique" do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end
  
  test "email validation should accept valid addresses" do
   valid_addresses = %w[user@eee.com r_tdd-ds@eee.hello.org user@example.com firs.last@name.au laura+joe@monk.cm]
   valid_addresses.each do |val|
    @user.email = val
    assert @user.valid?, '#{va.inspect} should be valid'
   end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org user_name@eee. eee@i_am_.com foo@bar+eee.com]
    invalid_addresses.each do |inval|
      @user.email = inval
      assert_not @user.valid?, '#{inval.inspect} should be invalid'
    end
    
      
  end
end
