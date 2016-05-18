class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  belongs_to :role
end