class Moods::EditPage < MainLayout
  needs operation : SaveMood
  needs mood : Mood
  quick_def page_title, "Edit Mood with id: #{@mood.id}"

  def content
    link "Back to all Moods", Moods::Index
    h1 "Edit Mood with id: #{@mood.id}"
    render_mood_form(@operation)
  end

  def render_mood_form(op)
    form_for Moods::Update.with(@mood.id) do
      # Edit fields in src/components/moods/form_fields.cr
      mount Moods::FormFields.new(op)

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
