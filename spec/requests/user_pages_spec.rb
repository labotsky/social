require 'spec_helper'

describe "User Pages" do
	subject{ page }
	describe "profile page" do
		let(:user){ FactoryGirl.create(:user) }
		before do
			visit root_path
			fill_in "session_email", with: user.email.upcase
			fill_in "session_password", with: user.password
			click_button "Войти"
			visit profile_path
		end	
		it{ should have_content(user.name) }
		it{ should have_content(user.surname) }
		it{ should have_content(user.date) }
		it{ should have_content(user.country) }
		it{ should have_content(user.sity) }
	end

	describe "signup" do
		before{ visit root_path }
		let(:submit){ "Присоединиться" }
		describe "with invalid information" do
			it "should not create a user" do
				expect{ click_button submit }.not_to change(User, :count)
			end
			it "should have error alert" do
				click_button submit
				should have_selector('div.message_notice',text: 'Извините, некоторые поля заполнены неверно.')
			end 
		end

		describe "with valid information" do
			before do
				fill_in "user_name",										with:"Sergey"
				fill_in "user_surname",									with:"Labotsky"
				fill_in "user_email",										with:"sergey1993.08@mail.ru"
				select('Belarus', 											:from => 'user_country')
				select "29", 														:from => "user_date_3i"
      	select "мая", 													:from => "user_date_2i"
      	select "1993", 													:from => "user_date_1i"
				fill_in "user_sity",										with:"Minsk"				
				fill_in "user_password",								with:"foobar"
				fill_in "user_password_confirmation",		with:"foobar"
			end
			it "should create a user" do
				expect{ click_button submit }.to change(User, :count).by(1)
			end
			it "should have alert success" do
				click_button submit
				should have_content('Приветствуем вас')
			end			
		end

		describe "profile page" do
			let(:user){FactoryGirl.create(:user)}
			let(:friend){FactoryGirl.create(:user)}
			let!(:m1){FactoryGirl.create(:micropost, user: user, content:'Foo', post_user_id:user.id)}
			let!(:m2){FactoryGirl.create(:micropost, user: user, content:'Bar', post_user_id:user.id)}
			before do
			visit root_path
			fill_in "session_email", with: user.email.upcase
			fill_in "session_password", with: user.password
			click_button "Войти"
			click_link "Пустите меня в Дестини!"
			end
			describe 'micropost' do
				it{should have_content(m1.content)}
				it{should have_content(m1.content)}
			end
			describe 'friends list' do
				before do												
					10.times do
						friend = FactoryGirl.create(:user)	
						user.follow!(friend)
					end
					visit profile_path
				end	
				it 'should have in a profile page' do
					should have_content('Мои друзья (10)')
					should have_selector('a img.friends_img')
				end
				it 'should have in a friends page' do				
					user.follow!(friend)					
					visit people_path(friend)
					should have_content('Друзья (1)')
					should have_selector('a img.friends_img')
				end
			end
		end
	end	
end
