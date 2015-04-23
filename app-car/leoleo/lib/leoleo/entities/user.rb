require 'lotus/entity'

class User
  include Lotus::Entity
  attributes :name, :email, :gender, :about, :image_url
end