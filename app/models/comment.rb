class Comment < ApplicationRecord
  belongs_to :post
  validates :title, presence: true, :length => { :minimum => 5 }
  validates :body, presence: true
end
