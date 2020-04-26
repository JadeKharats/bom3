class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column email : String
    column encrypted_password : String
    column pseudo : String

    has_many moods : Mood
    has_many members : Member
    has_many teams : Team, through: :members
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end
end
