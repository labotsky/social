namespace :db do
	desc "create microposts"
	task populate: :environment do
		make_admin
		make_users		
		make_microposts
		make_comments		
	end	
end
	
	def make_admin
		User.create(name: 'Сергей', surname: 'Лабоцкий', email: 'sergey1993.08@mail.ru', country: 'Belarus',
		 sity: 'Minsk', password: '123456', password_confirmation: '123456', date: '1993-05-05')
	end

	def make_microposts
		30.times do |n|
			30.times do |m|
				print '.'
				content = Faker::Lorem.paragraph
				user_id = m
				post_user_id = 1 + Random.rand(30)
				Micropost.create(content: content, user_id: user_id, post_user_id: post_user_id)
			end
		end	
	end

	def make_users
		30.times do |n|
			print '.'
			name = Faker::Name.first_name
			surname = Faker::Name.last_name
			email = Faker::Internet.email
			country = 'Belarus'
			sity = 'Minsk'
			password = '123456'
			password_confirmation = '123456'
			date = '1993-05-05'			
			User.create(name: name, surname: surname, email: email, country: country, sity: sity,
				password: password, password_confirmation: password_confirmation, date: date)
		end	
	end

	def make_comments
		400.times do |n|
			print '.'
			content = Faker::Lorem.paragraph
			micropost_id = 1 + Random.rand(30)
			post_user_id = 1 + Random.rand(30)
			Comment.create(content: content, micropost_id: micropost_id, post_user_id: post_user_id)
		end	
	end
	
