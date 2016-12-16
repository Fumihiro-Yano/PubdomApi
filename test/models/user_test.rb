require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
	  @user = User.new(name:"Yano Fumihiro",email:"yano@example.com",password: "foobar", password_confirmation: "foobar")
	end

	test "userの正常系のバリデーションのテスト" do
	  assert @user.valid?
	end

	test "nameが空の場合バリデーションに引っかかるテスト" do
	  @user.name = " "
	  assert_not @user.valid?
	end

 	test "emailが空の場合バリデーションに引っかかるテスト" do
 	  @user.email = " "
 	  assert_not @user.valid?
 	end

 	test "nameの長さが51文字の場合バリデーションに引っかかるテスト" do
 	  @user.name = "a" * 51
 	  assert_not @user.valid? 
    end

    test "nameの長さが50文字の場合バリデーションに引っかからないテスト" do
      @user.name = "a" * 50
      assert @user.valid?
    end

    test "emailの長さが256文字以上の場合バリデーションに引っかかるテスト" do
      @user.email = "a" * 256  + "@example.com"
      assert_not @user.valid?
    end

    test "正常系のメールアドレスのバリデーションが通るテスト" do
      valid_addresses = %w[user@example.com USER@foo.COM alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
      	@user.email = valid_address
      	assert @user.valid?, "#{valid_address.inspect} should be valid"
      end     
    end

    test "異常系のメールアドレスのバリデーションに引っかかるテスト" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
      end
    end

    test "userがユニークでない場合はバリデーションに引っかかるテスト" do
      #dup関数は同じ属性と同じものを作る関数
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      assert_not duplicate_user.valid?
    end

    test "メールアドレスを保存する前に小文字にするテスト" do
      mixed_case_email = "Foo@ExAMPle.CoM"
      @user.email = mixed_case_email
      @user.save
      #reloadメソッドは再度データベースから情報を更新する関数
      assert_equal mixed_case_email.downcase, @user.reload.email
    end

    test "パスワードが空の際はバリデーションに引っかかるテスト" do
      @user.password = @user.password_confirmation = " " * 6
      assert_not @user.valid?
    end

    test "パスワードの文字数が6文字未満ならバリデーションに引っかかるテスト" do
      @user.password = @user.password_confirmation = "a" * 5
      assert_not @user.valid?
    end
end
