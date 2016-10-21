class Category < ActiveRecord::Base
  validates :title, uniqueness: true
end
