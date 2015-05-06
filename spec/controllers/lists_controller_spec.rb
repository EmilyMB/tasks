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

  it "POST #create" do
    post :create, list: { title: "A new list" }

    expect(response).to have_http_status(:redirect)
    expect(List.count).to eq(1)
  end

  it "GET #edit" do
    list = create(:list)

    get :edit, id: list.id

    expect(response).to have_http_status(:success)
  end

  it "PUT #update" do
    list = create(:list)

    put :update, id: list.id, list: { title: "New Title", archived: true }

    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to(assigns(:list))
    expect(List.first.title).to eq("New Title")
    expect(List.first.archived).to be_truthy
  end

  it "DELETE #destroy" do
    list = create(:list, title: "Deleteme list")

    delete :destroy, id: list.id

    expect(response).to have_http_status(:redirect)
    expect(response.body).not_to include("Deleteme list")
    expect(List.count).to eq(0)
  end

  it "GET #complete assigns @tasks" do
    list = create(:list)
    task_in_progress = create(:task, list_id: list.id, title: "fun")
    task_complete = create(:task, list_id: list.id, complete: true, title: "good")
    list.tasks << [task_in_progress, task_complete]

    get :complete, id: list.id

    expect(response).to have_http_status(:success)
    expect(assigns[:tasks]).to eq([task_complete])
  end
end
