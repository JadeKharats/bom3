class CreateMembers::V20200426112856 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Member) do
      primary_key id : Int64
      add_timestamps
      add user_id : Int64
      add team_id : Int64
    end
  end

  def rollback
    drop table_for(Member)
  end
end
