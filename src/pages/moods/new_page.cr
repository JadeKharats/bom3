class Moods::NewPage < MainLayout
  needs operation : SaveMood
  quick_def page_title, "New Mood"

  def content
    render_mood_form(@operation)
  end

  def render_mood_form(op)
    form_for Moods::Create do
      # Edit fields in src/components/moods/form_fields.cr
      mount Moods::FormFields.new(op)

      submit "Envoyer", data_disable_with: "Saving...", class: "button is-primary is-inverted is-medium"
    end
  end
end
