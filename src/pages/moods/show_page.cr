class Moods::ShowPage < MainLayout
  needs mood : Mood
  quick_def page_title, "Mood with id: #{@mood.id}"

  def content
    link "Back to all Moods", Moods::Index
    h1 "Mood with id: #{@mood.id}"
    render_actions
    render_mood_fields
  end

  def render_actions
    section do
      link "Edit", Moods::Edit.with(@mood.id)
      text " | "
      link "Delete",
        Moods::Delete.with(@mood.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_mood_fields
    ul do
      li do
        text "user_id: "
        strong @mood.user_id.to_s
      end
      li do
        text "level: "
        strong @mood.level.to_s
      end
      li do
        text "time: "
        strong @mood.time.to_s
      end
      li do
        text "comment: "
        strong @mood.comment.to_s
      end
    end
  end
end
