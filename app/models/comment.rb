class Comment < ActiveRecord::Base
  #code
  belongs_to :user
  belongs_to :store
end
