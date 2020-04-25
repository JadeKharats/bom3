class Me::ShowPage < MainLayout
  needs my_moods : MoodQuery
  def content
    div(class: "tile is-ancestor") do
      mood_of_the_day
      all_my_moods
    end
  end


  private def mood_of_the_day
    div(class: "tile is-parent") do
      tag("articles", class: "tile is-child box") do
        tag("p",class: "title has-text-primary") do
          text "Humeur du moment"
        end
        div(class: "content") do
          link "Poster une nouvelle humeur", to: Moods::New, class: "button is-primary"
        end
      end
    end
  end

  private def all_my_moods
    div(class: "tile is-parent") do
      tag("articles", class: "tile is-child box") do
        tag("p",class: "title has-text-primary") do
          text "Mon historique"
        end
        div(class: "content") do
          @my_moods.each do |mood|
            div(class: "box") do
              tag("article", class: "media") do
                div(class: "media-left") do
                  text "#{mood.level}"
                end
                div(class: "media-content") do
                  text "#{mood.comment}"
                end
              end
            end
          end
        end
      end
    end
  end
end
