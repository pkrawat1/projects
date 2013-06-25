require 'spec_helper'
describe SurveysController do

  describe 'GET #new' do
    
    it 'assign empty survey object' do
      get :new
      expect(assigns(:survey).new_record?).to eq(true)
    end
    
    it 'must render the new page' do
      get :new
      expect(response).to render_template :new
      expect(response.status).to eq(200)
    end

  end

  describe 'POST #create' do
  
    it 'should create survey with valid parameters' do
      post :create,{survey: {name: 'survey 3',year: 2013}}
      expect(assigns(:survey).valid?).to eq(true)
    end
   
    it 'redirect to index page if valid survey' do
      post :create,{survey: {name: 'survey 3',year: 2013}}
      expect(response).to redirect_to surveys_path
    end

    it 'should not save the survey with invalid attributes' do
      post :create, {survey: {}}
      expect(assigns(:survey).valid?).to eq(false)
    end

    it 're-render the same page if invalid survey' do      
      post :create, {survey: {}}
      expect(response).to render_template :new
    end
  end

end
