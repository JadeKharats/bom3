class Teams::IndexPage < MainLayout
  needs teams : TeamQuery
  quick_def page_title, "All Teams"

  def content
    tag("section") do
      link "Créer un équipe", to: Teams::New, class: "button is-primary is-inverted is-medium"
    end
    tag("section") do
      render_teams
    end
  end

  def render_teams
    tag("table", class: "table is-fullwidth") do
      @teams.each do |team|
        tag("tr") do
          tag("td") do
            text truncate_text(team.name, length: 30)
          end
        end
      end
    end
  end
end
