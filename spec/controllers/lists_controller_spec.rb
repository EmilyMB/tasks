require "rails_helper"

RSpec.describe ListsController, type: :controller do
  it "GET #index" do
    get :index

    expect(response).to have_http_status(:success)
  end

  it "GET #show/:id" do
    list = create(:list)

    get :show, id: list.id

    expect(response).to have_http_status(:success)
  end
end
