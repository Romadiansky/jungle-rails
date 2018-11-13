require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should save successfully if all fields are properly filled out' do
      @user = User.new
      @user.first_name = 'first name'
      @user.last_name = 'last name'
      @user.email = 'user email'
      @user.password = 'user password'
      @user.password_confirmation = @user.password
      expect(@user.save).to be true
    end

  it 'should have a first name' do
      @user = User.new
      @user.last_name = 'last name'
      @user.email = 'user email'
      @user.password = 'user password'
      @user.password_confirmation = @user.password
      expect(@user.save).to be false
    end

    it 'should have a last name' do
      @user = User.new
      @user.first_name = 'first name'
      @user.email = 'user email'
      @user.password = 'user password'
      @user.password_confirmation = @user.password
      expect(@user.save).to be false
    end

    it 'should have an email' do
      @user = User.new
      @user.first_name = 'first name'
      @user.last_name = 'last name'
      @user.password = 'user password'
      @user.password_confirmation = @user.password
      expect(@user.save).to be false
    end

    it 'should have a password' do
      @user = User.new
      @user.first_name = 'first name'
      @user.last_name = 'last name'
      @user.email = 'user email'
      @user.password_confirmation = @user.password
      expect(@user.save).to be false
    end

    it 'should have a password confirmation' do
      @user = User.new
      @user.first_name = 'first name'
      @user.last_name = 'last name'
      @user.email = 'user email'
      @user.password = 'user password'
      expect(@user.save).to be false
    end

    it 'should have a password confirmation equal to user password' do
      @user = User.new
      @user.first_name = 'first name'
      @user.last_name = 'last name'
      @user.email = 'user email'
      @user.password = 'user password'
      @user.password_confirmation = 'random other string'
      expect(@user.save).to be false
    end
  end

  before :each do
    @user1 = User.create(email: 'tests@test.com', password: 'poi', password_confirmation: 'poi', first_name: 'name', last_name: 'madamname')
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate successfully' do
      login = User.authenticate_with_credentials('tests@test.com', 'poi')
      expect(login).to eq(@user1)
    end

    it 'should fail to authenticate' do
      login = User.authenticate_with_credentials('tests@test.com', 'xxx')
      expect(login).to be false
    end

    it 'should allow people to login with spaces in their email addresses' do
      login = User.authenticate_with_credentials(' tests@test.com ', 'poi')
      expect(login).to eq(@user1)
    end

    it 'should allow logins with capital letters in the email address' do
      login = User.authenticate_with_credentials('TeSts@test.com', 'poi')
      expect(login).to eq(@user1)
    end

  end

end
