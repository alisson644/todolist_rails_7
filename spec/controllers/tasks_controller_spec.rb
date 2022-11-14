require "rails_helper"

RSpec.describe TasksController, type: :controller  do
  describe "GET index" do
    let(:current_user) { create(:user) }
  
    it "authenticate" do
      sign_in(current_user, scope: :user)
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  
    it "unauthenticate" do
      get :index
      expect(response).not_to be_successful
      expect(response).to have_http_status(:redirect)
    end
  end
  
  describe "GET show" do
    let(:current_user) { create(:user) }
    let(:task) { create(:task, user: current_user) }
  
    it "authenticate" do
      sign_in(current_user, scope: :user)
      get :show, params: { id: task.id }
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  
    it "unauthenticate" do
      get :show, params: { id: task.id }
      expect(response).not_to be_successful
      expect(response).to have_http_status(:redirect)
    end
  end
  
  describe "GET new" do
    let(:current_user) { create(:user) }
  
    it "authenticate" do
      sign_in(current_user, scope: :user)
      get :new
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  
    it "unauthenticate" do
      get :new
      expect(response).not_to be_successful
      expect(response).to have_http_status(:redirect)
    end
  end
 
  describe "GET edit" do
    let(:current_user) { create(:user) }
    let(:task) { create(:task, user: current_user) }
  
    it "authenticate" do
      sign_in(current_user, scope: :user)
      get :edit, params: { id: task.id }
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  
    it "unauthenticate" do
      get :edit, params: { id: task.id }
      expect(response).not_to be_successful
      expect(response).to have_http_status(:redirect)
    end
  end
  
  describe "POST create" do
    let(:current_user) { create(:user) }
    let(:task) { build(:task, user: current_user) }
  
    it "authenticate" do
      sign_in(current_user, scope: :user)
      post :create, params: { task: { title: task.title, body: task.body, completed: false } }
      expect(response).to have_http_status(:redirect)
    end
  
    it "unauthenticate" do
      post :create, params: { task: { title: task.title, body: task.body, completed: false } }
      expect(response).not_to be_successful
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "PUT update" do
    let(:current_user) { create(:user) }
    let(:task) { create(:task, user: current_user) }
  
    it "authenticate" do
      sign_in(current_user, scope: :user)
      put :update, params: { id: task.id, task: { completed: true } }
      expect(response).to have_http_status(:redirect)
    end
  
    it "unauthenticate" do
      put :update, params: { id: task.id, task: { completed: true } }
      expect(response).not_to be_successful
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE update" do
    let(:current_user) { create(:user) }
    let(:task) { create(:task, user: current_user) }
  
    it "authenticate" do
      sign_in(current_user, scope: :user)
      delete :destroy, params: { id: task.id }
      expect(response).to have_http_status(:redirect)
    end
  
    it "unauthenticate" do
      delete :destroy, params: { id: task.id }
      expect(response).not_to be_successful
      expect(response).to have_http_status(:redirect)
    end
  end
end