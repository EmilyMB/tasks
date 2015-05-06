require "rails_helper"

RSpec.describe TasksController, type: :controller do
  it "GET #new" do
    get :new

    expect(response).to have_http_status(:success)
    expect(response).to render_template(:new)
  end

  it "POST #create" do
    list = create(:list)
    post :create, task: { title: "A new task", list_id: list.id}

    expect(response).to have_http_status(:redirect)
    expect(Task.count).to eq(1)
  end

  it "GET #edit" do
    task = create(:task)

    get :edit, id: task.id

    expect(response).to have_http_status(:success)
  end

  it "PUT #update" do
    task = create(:task)
    @file = fixture_file_upload('files/panda.jpg', 'image/jpeg')

    put :update, id: task.id, task: { title: "New Title", complete: true, file: @file }

    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to(list_path(task.list_id))
    expect(Task.first.title).to eq("New Title")
    expect(Task.first.complete).to be_truthy
  end

  it "PUT #remove_file" do
    task = create(:task)
    put :update, id: task.id, task: { file: @file }

    put :remove_file, id: task.id

    expect(response).to have_http_status(:redirect)
    expect(task.file.url).to eq("")
  end

  it "GET #change_status" do
    task = create(:task)

    get :change_status, id: task.id, task: { complete: true }

    expect(response).to have_http_status(:redirect)
    expect(Task.first.complete).to be_truthy
  end
end
