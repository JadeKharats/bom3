class Teams::NewPage < MainLayout
  needs operation : SaveTeam
  quick_def page_title, "New Team"

  def content
    div(class: "tile is-ancestor") do
      h2(class: "title has-text-light") do
        text "Création d'équipe"
      end
    end
    render_team_form(@operation)
  end

  def render_team_form(op)
    form_for Teams::Create do
      # Edit fields in src/components/teams/form_fields.cr
      mount Teams::FormFields.new(op)

      submit "Créer", data_disable_with: "Saving...", class: "button is-primary is-inverted is-medium"
    end
  end
end
