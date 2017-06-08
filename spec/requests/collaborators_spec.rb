require 'rails_helper'

RSpec.describe "Collaborators", type: :request do
  describe "GET /collaborators" do
    it "works! (now write some real specs)" do
      get collaborators_path
      expect(response).to have_http_status(200)
    end
  end
end
