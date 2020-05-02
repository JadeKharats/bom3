require "../../../spec_helper"

describe Api::SignUps::Create do
  it "creates user on sign up" do
    UserToken.stub_token("fake-token") do
      client = AppClient.new
        .headers(origin: "localhost")
      response = client.exec(Api::SignUps::Create, user: valid_params)

      response.should send_json(200, token: "fake-token")
      new_user = UserQuery.first
      new_user.email.should eq(valid_params[:email])
    end
  end

  it "returns error for invalid params" do
    invalid_params = valid_params.merge(password_confirmation: "wrong")
    client = AppClient.new
      .headers(origin: "localhost")
    response = client.exec(Api::SignUps::Create, user: invalid_params)

    UserQuery.new.select_count.should eq(0)
    response.should send_json(
      400,
      param: "password_confirmation",
      details: "password_confirmation must match"
    )
  end
end

private def valid_params
  {
    email:                 "test@email.com",
    pseudo:                "pseudo-api",
    password:              "password",
    password_confirmation: "password",
  }
end
