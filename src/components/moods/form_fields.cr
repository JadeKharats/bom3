class Moods::FormFields < BaseComponent
  needs operation : SaveMood

  def render
    mount Shared::Field.new(operation.level), &.text_input(autofocus: "true")
    mount Shared::Field.new(operation.comment)
  end
end