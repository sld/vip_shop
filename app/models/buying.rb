class Buying < ActiveRecord::Base
  belongs_to :user
  has_one :cart

  paginates_per 5
end
