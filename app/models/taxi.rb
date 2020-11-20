class Taxi < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :image    
    validates :departure,               format: { with: /(https?|ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)/, message: 'ちゃんとURLを入力してください。'}
    validates :arrival,                 format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '英字や。などは表現出来ません。'}
    validates :title                   
    validates :text                    
  end

  def self.search(search)
    if search != ""
      Taxi.where('title LIKE(?)', "%#{search}%")
    else
      Taxi.all
    end
  end
end
