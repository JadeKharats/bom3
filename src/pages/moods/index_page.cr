class Moods::IndexPage < MainLayout
  needs moods : MoodQuery
  quick_def page_title, "All Moods"

  def content
    h1 "All Moods"
    link "New Mood", to: Moods::New
    render_moods
  end

  def render_moods
    ul do
      @moods.each do |mood|
        li do
          link mood.user_id, Moods::Show.with(mood)
        end
      end
    end
  end
end
