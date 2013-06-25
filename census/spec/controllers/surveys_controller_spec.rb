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

    it 'should create survey with minimum 3 question' do
      
      post :create,{survey: {name: 'survey 3',year: 2013,questions_attributes: {'0'=> {desc: 'question no 1'},
                                                                                '1'=> {desc: 'question no 2'},
                                                                                '2'=> {desc: 'question no 3'}
                                                                               }
                   }}
      expect(response).to redirect_to surveys_path
      s=Survey.last
      p s
      p s.questions
    end
    
    
    it 'should not create survey with invalid parameters' do
      post :create,{survey: {}}
      expect(assigns(:survey).valid?).to eq(false)
    end

    it 'should not save the survey with invalid attributes' do
      post :create,{survey: {name: 'survey 3',year: 2013,questions_attributes: {'0'=> {desc: 'question no 1'},
                                                                                '1'=> {desc: 'question no 2'},
                                                                               }
                   }}
      expect(response).to render_template :new
    end

  end

end
