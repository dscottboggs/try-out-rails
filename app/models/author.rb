class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, # <== defaults
         :recoverable, :rememberable, :validatable, # <== defaults
         :lockable, :confirmable, :trackable # <== my additions
  has_many :articles, dependent: :destroy

  def name
    email.split("@")[0].capitalize
  end
end
