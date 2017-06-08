require 'rails_helper'

RSpec.describe "collaborators/edit", type: :view do
  before(:each) do
    @collaborator = assign(:collaborator, Collaborator.create!())
  end

  it "renders the edit collaborator form" do
    render

    assert_select "form[action=?][method=?]", collaborator_path(@collaborator), "post" do
    end
  end
end
