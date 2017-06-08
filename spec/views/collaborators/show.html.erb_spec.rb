require 'rails_helper'

RSpec.describe "collaborators/show", type: :view do
  before(:each) do
    @collaborator = assign(:collaborator, Collaborator.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
