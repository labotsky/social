module MicropostsHelper
	def toggle_like_button(micropost, user)
		if user.flagged?(micropost, :like)
			link_to 'Не нравится', like_micropost_path(micropost), remote: true, method: :get
		else
			link_to 'Мне нравится', like_micropost_path(micropost), remote: true, method: :get
		end
	end
end
