require 'spec_helper'
i
describe SurveysController do

  describe 'GET #new' do
    it 'assign empty survey object' do
      get :new
      expect(assigns(:survey).new_record?).to eq(true)
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it 'should create survey with valid parameters' do
      post :create,{survey: {name: 'survey 3',year: 2013}}
      expect(assigns(:survey).new_record?).to eq(false)
    end
  end
end
