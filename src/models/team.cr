class Team < BaseModel
  table do
    column name : String
    column description : String

    has_many members : Member
    has_many users : User, through: :members
  end
end
