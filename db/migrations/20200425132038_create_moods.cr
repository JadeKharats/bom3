class CreateMoods::V20200425132038 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Mood) do
      primary_key id : Int64
      add_timestamps
      add user_id : Int64
      add level : Int16
      add time : Time
      add comment : String
    end
  end

  def rollback
    drop table_for(Mood)
  end
end
