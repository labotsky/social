module MicropostsHelper
	def toggle_like_button(title, model, user)
		case title
		when 'micropost'
			if user.flagged?(model, :like)
				link_to 'Не нравится', like_micropost_path(model), remote: true, method: :get
			else
				link_to 'Мне нравится', like_micropost_path(model), remote: true, method: :get
			end
		when 'comment'
			if user.flagged?(model, :like)
				link_to 'Не нравится', like_comment_path(model), remote: true, method: :get
			else
				link_to 'Мне нравится', like_comment_path(model), remote: true, method: :get
			end
		end		
	end

	def imageall(id, type)
  		imageposts = Imagepost.where({imagepostable_id: id, imagepostable_type: type})
  	end 
end
