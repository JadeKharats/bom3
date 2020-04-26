class CreateTeams::V20200426111540 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Team) do
      primary_key id : Int64
      add_timestamps
      add name : String
      add description : String
    end
  end

  def rollback
    drop table_for(Team)
  end
end
