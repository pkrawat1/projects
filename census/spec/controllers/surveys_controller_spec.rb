require 'spec_helper'
describe SurveysController do

  describe 'GET #index' do
    it 'must assign survey object' do
      surveys=Survey.all
      get :index
      expect(assigns(:surveys)).to eq(surveys)
      expect(response).to render_template :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #new' do
    
    it 'must assign empty survey object' do
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
      
      post :create,{survey: {name: 'survey new',year: 2013,
                             questions_attributes: {'0'=> {desc: 'question no 1',
                                                           options_attributes:{'0'=>{desc: 'option 1'},
                                                                               '1'=>{desc: 'option 2'},
                                                                               '2'=>{desc: 'option 3'}
                                                          }                   },
                                                    '1'=> {desc: 'question no 2',
                                                           options_attributes:{'0'=>{desc: 'option 1'},
                                                                               '1'=>{desc: 'option 2'},
                                                                               '2'=>{desc: 'option 3'}
                                                          }                   },
                                                    '2'=> {desc: 'question no 3',
                                                           options_attributes:{'0'=>{desc: 'option 1'},
                                                                               '1'=>{desc: 'option 2'},
                                                                               '2'=>{desc: 'option 3'}
                                                          }                   }
                                                   }
                   }}
      expect(response).to redirect_to surveys_path
    end
    
    
    it 'should not create survey with invalid parameters' do
      post :create,{survey: {}}
      expect(assigns(:survey).valid?).to eq(false)
    end

    it 'should not save the survey with invalid no of questions' do
      post :create,{survey: {name: 'survey new',year: 2013,questions_attributes: {'0'=> {desc: 'question no 1'},
                                                                                '1'=> {desc: 'question no 2'},
                                                                                '2'=> {desc: 'question no 3'}
                                                                               }
                   }}
      expect(response).to render_template :new
    end

  end

  describe 'PUT #update' do
    it 'should update survey with valid parameters' do
      Survey.create(name: 'new survey',year: 2013)
      survey=Survey.last
      put :update, {id: survey.id, survey: {name: 'updated survey', year: 2013}}
      expect(response).to redirect_to surveys_path
    end
  end
  
  describe 'DELETE #destroy' do
    it 'must delete the survey' do
      Survey.create(name: 'new survey',year: 2013)
      survey=Survey.last
      delete :destroy,id: survey.id
      expect(response).to render_template :index
    end
  end

end
