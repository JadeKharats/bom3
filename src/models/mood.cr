class Mood < BaseModel
  table do
    # column user_id : Int64
    column level : Int16
    column time : Time
    column comment : String

    belongs_to user : User
  end
end
