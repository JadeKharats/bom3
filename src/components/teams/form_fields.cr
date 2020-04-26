class Teams::FormFields < BaseComponent
  needs operation : SaveTeam

  def render
    mount Shared::Field.new(operation.name, "Nom"), &.text_input(autofocus: "true")
    mount Shared::Field.new(operation.description)
  end
end
