require 'rails_helper'

RSpec.describe "collaborators/index", type: :view do
  before(:each) do
    assign(:collaborators, [
      Collaborator.create!(),
      Collaborator.create!()
    ])
  end

  it "renders a list of collaborators" do
    render
  end
end
