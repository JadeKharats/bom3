class Member < BaseModel
  table do
    # column user_id : Int64
    # column team_id : Int64

    belongs_to user : User
    belongs_to team : Team
  end
end
