require "rails_helper"

describe "users/show.html.erb" do
  before :each do
    @fake_user = double("user", name: "Viet")
  end
  it "render a user" do
    assign(:user, @fake_user)

    render template: "users/show.html.erb"

    expect(@fake_user.name).to eq("Viet")
  end
end
