require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should save successfully if all fields are properly filled out' do
      @user = User.new
      @user.first_name = 'first name'
      @user.last_name = 'last name'
      @user.email = 'user email'
      @user.password = 'user password'
      @user.password_confirmation = 'user password'
      expect(@user.save).to be true
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should have a first name' do
      @user = User.new
      @user.last_name = 'last name'
      @user.email = 'user email'
      @user.password = 'user password'
      @user.password_confirmation = 'user password'
      expect(@user.save).to be false
    end

    it 'should have a last name' do
      @user = User.new
      @user.first_name = 'first name'
      @user.email = 'user email'
      @user.password = 'user password'
      @user.password_confirmation = 'user password'
      expect(@user.save).to be false
    end

    it 'should have an email' do
      @user = User.new
      @user.first_name = 'first name'
      @user.last_name = 'last name'
      @user.password = 'user password'
      @user.password_confirmation = user.password
      expect(@user.save).to be false
    end

    it 'should have a password' do
      @user = User.new
      @user.first_name = 'first name'
      @user.last_name = 'last name'
      @user.email = 'user email'
      @user.password_confirmation = 'user password'
      expect(@user.save).to be false
    end

    it 'should have a password confirmation that matches the password' do
      @user = User.new
      @user.first_name = 'first name'
      @user.last_name = 'last name'
      @user.email = 'user email'
      @user.password = 'user password'
      expect(@user.save).to be false
    end
  end


end
