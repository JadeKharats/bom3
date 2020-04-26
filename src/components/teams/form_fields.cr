class Teams::FormFields < BaseComponent
  needs operation : SaveTeam

  def render
    mount Shared::Field.new(operation.name), &.text_input(autofocus: "true")
    mount Shared::Field.new(operation.description)
  end
end
