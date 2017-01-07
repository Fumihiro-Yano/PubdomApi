class Article < ApplicationRecord
  
  REGISTRABLE_ATTRIBUTES = %i(
  	title
  	description
  	image
  	status
  	created_user_id
  )
end
