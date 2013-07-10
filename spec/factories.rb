FactoryGirl.define do
	factory :user do
		name	"Sergey"
		surname	"Labotsky"
		sequence(:email) {|n| "person_#{n}@example.com"} 
		country	"Belarus"
		sity	"Minsk"
		date	"1993-05-13"
		password	"foobar"
		password_confirmation	"foobar"
	end
	factory :micropost do
		content "Lorem ipsum"
		user
		post_user_id 1
	end	
end