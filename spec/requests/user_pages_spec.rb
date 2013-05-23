require 'spec_helper'

describe "User Pages" do
	subject{ page }
	describe "profile page" do
		let(:user){ FactoryGirl.create(:user) }
		before{ visit user_path(user) }
		it{ should have_selector('h6', text: user.name) }
		it{ should have_content(user.surname) }
		it{ should have_content(user.date) }
		it{ should have_content(user.country) }
		it{ should have_content(user.sity) }
	end

	describe "signup" do
		before{ visit signup_path }
		let(:submit){ "Все заполнил" }
		describe "with invalid information" do
			it "should not create a user" do
				expect{ click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "user_name",						with:"Sergey"
				fill_in "user_surname",						with:"Labotsky"
				fill_in "user_email",						with:"sergey1993.08@mail.ru"
				select('Belarus', :from => 'user_country')
				fill_in "user_sity",						with:"Minsk"
				fill_in "user_date",						with:"13.05.1993"
				fill_in "user_password",					with:"foobar"
				fill_in "user_password_confirmation",		with:"foobar"
			end
			it "should create a user" do
				expect{ click_button submit }.to change(User, :count).by(1)
			end
			it "should have alert success" do
				click_button submit
				should have_selector('div.alert.alert-success',text: 'Вы успешно зарегистрированы.')
			end			
		end
	end	
end
