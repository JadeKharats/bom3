class Me::ShowPage < MainLayout
  needs my_moods : MoodQuery
  def content
    tag("section", class: "content") do
      # h3 "Compte :  #{@current_user.email}"
      mood_of_the_day
      all_my_moods
    end

  end

  private def mood_of_the_day
    h3 "Humeur du moment"
    link "Poster une nouvelle humeur", to: Moods::New, class: "btn"
  end

  private def all_my_moods
    h3 "Mon historique"
    ul do
      @my_moods.each do |mood|
        li do
          link "#{mood.level} - #{mood.comment}", Moods::Show.with(mood)
        end
      end
    end
  end
end
