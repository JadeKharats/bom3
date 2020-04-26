class Teams::IndexPage < MainLayout
  needs teams : TeamQuery
  quick_def page_title, "All Teams"

  def content
    div(class: "tile is-ancestor") do
      link "Créer un équipe", to: Teams::New, class: "button is-primary is-inverted is-medium"
      render_teams
    end
  end

  def render_teams
    div(class: "tile is-parent") do
      tag("articles", class: "tile is-child box") do
        tag("p",class: "title has-text-primary") do
          text "les équipes"
        end
        div(class: "content") do
          @teams.each do |team|
            div(class: "box has-text-light has-background-info") do
              link to: Teams::Show.with(team), class: "has-text-light" do
                tag("article", class: "media") do
                  div(class: "media-content") do
                    text team.name
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
