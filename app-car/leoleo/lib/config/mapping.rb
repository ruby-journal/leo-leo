collection :users do
  entity     User
  repository UserRepository

  attribute :id,        Integer
  attribute :name,      String
  attribute :email,     String
  attribute :gender,    Integer
  attribute :about,     String
  attribute :image_url, String
end