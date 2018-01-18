require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    DatabaseCleaner.start
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { age: @user.age, email: "MyString4", name: @user.name, phone: @user.phone, sex: @user.sex, type: @user.user_type } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { age: @user.age, email: @user.email, name: @user.name, phone: @user.phone, sex: @user.sex, type: @user.user_type } }, as: :json
    assert_response 200
  end

  # test "should not destroy user" do
  #   assert_difference('User.count', 0) do
  #     delete user_url(@user), as: :json
  #   end
  #
  #   assert_response 404
  # end
end
