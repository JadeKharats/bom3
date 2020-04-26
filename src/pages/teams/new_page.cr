class Teams::NewPage < MainLayout
  needs operation : SaveTeam
  quick_def page_title, "New Team"

  def content
    h1 "New Team"
    render_team_form(@operation)
  end

  def render_team_form(op)
    form_for Teams::Create do
      # Edit fields in src/components/teams/form_fields.cr
      mount Teams::FormFields.new(op)

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
