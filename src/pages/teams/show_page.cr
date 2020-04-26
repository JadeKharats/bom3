class Teams::ShowPage < MainLayout
  needs team : Team
  quick_def page_title, "Team with id: #{@team.id}"

  def content
    div(class: "tile is-ancestor") do
      h2(class: "title has-text-light") do
        link "#{team.name}", to: Teams::Edit.with(@team.id), class: "has-text-light"
      end
      tag("p", class: "title has-text-light") do
        text "#{team.description}"
      end
    end
  end
end
