class Teams::ShowPage < MainLayout
  needs team : Team
  needs members : MemberQuery
  quick_def page_title, "Team with id: #{@team.id}"

  def content
    div(class: "tile is-ancestor") do
      h2(class: "title has-text-light") do
        link "#{team.name}", to: Teams::Edit.with(@team.id), class: "has-text-light"
      end
      div(class: "title has-text-light") do
        text "#{team.description}"
        div(class: "tags has-addons") do
          span(class: "tag is-dark") do
            text "Membres"
          end
          span(class: "tag is-info") do
            text "#{members.size}"
          end
        end
      end

    end
  end
end
