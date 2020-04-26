class Teams::EditPage < MainLayout
  needs operation : SaveTeam
  needs team : Team
  quick_def page_title, "Edit Team with id: #{@team.id}"

  def content
    link "Back to all Teams", Teams::Index
    h1 "Edit Team with id: #{@team.id}"
    render_team_form(@operation)
  end

  def render_team_form(op)
    form_for Teams::Update.with(@team.id) do
      # Edit fields in src/components/teams/form_fields.cr
      mount Teams::FormFields.new(op)

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
