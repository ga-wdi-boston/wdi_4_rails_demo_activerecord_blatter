class Blat < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 140 }
  validates :body, presence: true
end
