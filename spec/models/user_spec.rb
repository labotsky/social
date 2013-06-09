# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  surname         :string(255)
#  email           :string(255)
#  country         :string(255)
#  sity            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  date            :date
#  image           :string(255)
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do

  before { @user = User.new(name: 'Segrey', surname: 'Labotsky', email: 'Sergey1993.08@mail.ru', country: 'Belarus',
  	sity: 'Minsk', date: '1993-05-13', password: 'foobar', password_confirmation: 'foobar') }
  subject { @user }

  it{ should respond_to(:name) }
  it{ should respond_to(:surname) }
  it{ should respond_to(:email) }
  it{ should respond_to(:country) }
  it{ should respond_to(:sity) }
  it{ should respond_to(:password_digest) }
  it{ should respond_to(:password) }
  it{ should respond_to(:password_confirmation) }
  it{ should respond_to(:authenticate) }
  it{ should respond_to(:remember_token) }
  it{ should respond_to(:microposts) }
  it{ should be_valid}

  describe "when name not present" do
  	before{ @user.name = ' ' }
  	it{ should_not be_valid }
  end

  describe "when surname not present" do
  	before{ @user.surname = ' ' }
  	it{ should_not be_valid }
  end

  describe "when email not present" do
  	before{ @user.email = ' ' }
  	it{ should_not be_valid }
  end

  describe "when country not present" do
  	before{ @user.country = ' ' }
  	it{ should_not be_valid }
  end

  describe "when sity not present" do
  	before{ @user.sity = ' ' }
  	it{ should_not be_valid }
  end

  describe "when name is too long" do
  	before { @user.name = 'a'*51 }
  	it{ should_not be_valid }
  end

  describe "when surname is too long" do
  	before { @user.surname = 'a'*51 }
  	it{ should_not be_valid }
  end

  describe "when email is too long" do
  	before { @user.email = 'a'*51 }
  	it{ should_not be_valid }
  end

  describe "when country is too long" do
  	before { @user.country = 'a'*51 }
  	it{ should_not be_valid }
  end

  describe "when sity is too long" do
  	before { @user.sity = 'a'*51 }
  	it{ should_not be_valid }
  end

  describe "when email format is invalid" do
  	it "should be invalid" do
  		addresses = %w[user@foo,by user_foo.by user@foo@foo.by foo@user+foo.by]
  		addresses.each do |invalid_address|
  			@user.email = invalid_address
  			@user.should_not be_valid
  		end
  	end
  end

  describe "when email format is valid" do
  	it "should be invalid" do
  		addresses = %w[user@foo.by user@foo.BY user.foo@foo.by user_foo@foo.by]
  		addresses.each do |valid_address|
  			@user.email = valid_address
  			@user.should be_valid
  		end
  	end
  end

  describe "when email address is already taken" do
  	before do
  		user_with_same_email = @user.dup
  		user_with_same_email.email = @user.email.upcase
  		user_with_same_email.save
  	end
  	it{ should_not be_valid }
  end

  describe "email address is save downcase format" do
  	before do 
  		@user.save
  		@user_find = User.find_by_email('sergey1993.08@mail.ru') 
  	end
  	it{ @user_find.should_not be_nil }
  end

  describe "when password not present" do
  	before{ @user.password = @user.password_confirmation = " " }
  	it{ should_not be_valid }
  end

  describe "when password does not match confirmation" do
  	before{ @user.password_confirmation = "mismatch" }
  	it{ should_not be_valid }
  end

  describe "when password confirmation is nil" do
  	before{ @user.password_confirmation = nil }
  	it{ should_not be_valid }
  end

  describe "return value of authenticate method" do
  	before{ @user.save }
  	let(:found_user) { User.find_by_email(@user.email) }
  	describe "with valid password" do
  		it{ should == found_user.authenticate(@user.password) }
  	end
  	describe "with invalid password" do
  		it{ should_not == found_user.authenticate('invalid') }
  	end
  end

  describe "with a password that`s too short" do
  	before{ @user.password = @user.password_confirmation = 'a'*5 }
  	it{ should_not be_valid }
  end

  describe "remember_token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  describe "micropost associations" do
    before {@user.save}
    let!(:older_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right microposts in the right order" do
      @user.microposts.should == [newer_micropost, older_micropost]
    end
  end 
end
