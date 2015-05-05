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

  it "GET #new" do
    get :new

    expect(response).to have_http_status(:success)
    expect(response).to render_template(:new)
  end

  it "GET #edit" do
    list = create(:list)

    get :edit, id: list.id

    expect(response).to have_http_status(:success)
  end

  it "PUT #update" do
    list = create(:list)

    put :update, id: list.id, :list => {  title: "New Title", archived: true }

    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to(assigns(:list))
    expect(List.first.title).to eq("New Title")
    expect(List.first.archived).to be_truthy
  end
end
