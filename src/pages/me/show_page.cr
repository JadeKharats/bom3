class Me::ShowPage < MainLayout
  needs my_moods : MoodQuery
  def content
    div(class: "tile is-ancestor") do
      h2(class: "title has-text-light") do
        link "@#{current_user.pseudo}", to: Me::Edit, class: "has-text-light"
      end
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
            div(class: "box has-background-#{color_level(mood.level)} has-text-light") do
              tag("article", class: "media") do
                div(class: "media-left") do
                  span(class: "icon is-medium") do
                    tag("i", class: "far fa-2x fa-#{icon_level(mood.level)}")
                  end
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

  private def color_level(level)
    return "danger" if level == 1
    return "warning" if level == 2
    return "grey-light" if level == 3
    return "info" if level == 4
    "success"
  end

  private def icon_level(level)
    return "angry" if level == 1
    return "frown" if level == 2
    return "meh" if level == 3
    return "laugh" if level == 4
    "grin-squint-tears"
  end
end
