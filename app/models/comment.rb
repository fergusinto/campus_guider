class Comment < ActiveRecord::Base
  #code
  belongs_to :User
  belongs_to :Store
end
