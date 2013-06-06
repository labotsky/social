require 'spec_helper'

describe "Authentication Pages" do

	subject {page}

	describe "signin" do
		before {visit root_path}
		describe "with invalid information" do
			before {click_button "Войти"}
			it {should have_selector('.message_notice', text:'Неверный email или пароль.')}
		end
		describe "with valid information" do
			let(:user) {FactoryGirl.create(:user)}
			before do
				fill_in "session_email", with: user.email.upcase
				fill_in "session_password", with: user.password
				click_button "Войти"
			end
			it {should have_selector('h4', text:"Ваше имя: #{user.name}")}
			it {should have_selector('h4', text:"Ваша фамилия: #{user.surname}")}
			it {should have_content(user.email)}
			it {should have_content('Приветствуем вас')}
			it {should have_content('Загрузить фотографию')}
			it {should have_content('Пустите меня в Дестини!')}
			describe "signout" do
				before {click_link 'Выйти'}				
				it {should have_content('Destiny')}
				it {should have_button('Войти')}
				it {should have_button('Присоединиться')} 
				it {should have_selector('title', :text => 'Destiny')} 	
			end
		end		
	end
end