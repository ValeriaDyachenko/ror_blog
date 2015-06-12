class Post < ActiveRecord::Base
	#валидания на заполнение полей
	validates :title,:body,  presence: true
end