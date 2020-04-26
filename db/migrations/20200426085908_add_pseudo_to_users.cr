class AddPseudoToUsers::V20200426085908 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(user) do
      add pseudo : String, fill_existing_with: "Achanger"
    end
  end

  def rollback
    alter table_for(user) do
      remove :pseudo
    end
  end
end
