class Teams::EditPage < MainLayout
  needs operation : SaveTeam
  needs team : Team
  quick_def page_title, "Edit Team with id: #{@team.id}"

  def content
    div(class: "tile is-ancestor") do
      h2(class: "title has-text-light") do
        text "Edition d'équipe"
      end
    end
    render_team_form(@operation)
  end

  def render_team_form(op)
    form_for Teams::Update.with(@team.id) do
      # Edit fields in src/components/teams/form_fields.cr
      mount Teams::FormFields.new(op)

      submit "Mettre à jour", data_disable_with: "Updating...", class: "button is-primary is-inverted is-medium"
    end
  end
end
