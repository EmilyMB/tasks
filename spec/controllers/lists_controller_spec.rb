require "rails_helper"

RSpec.describe ListsController, type: :controller do
  it "GET #index" do
    get :index

    expect(response).to have_http_status(:success)
  end
end
