class MoodSerializer < BaseSerializer
  def initialize(@mood : Mood)
  end

  def render
    {
      level: @mood.level,
      comment: @mood.comment,
      user: @mood.user.pseudo
    }
  end
end
