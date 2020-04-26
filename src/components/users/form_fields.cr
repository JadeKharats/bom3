class Users::FormFields < BaseComponent
  needs operation : SaveUser

  def render
    mount Shared::Field.new(operation.pseudo)
  end
end
