require 'rails_helper'

RSpec.describe "collaborators/new", type: :view do
  before(:each) do
    assign(:collaborator, Collaborator.new())
  end

  it "renders new collaborator form" do
    render

    assert_select "form[action=?][method=?]", collaborators_path, "post" do
    end
  end
end
