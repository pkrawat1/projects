require 'spec_helper'
describe SurveysController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  

  let(:survey){Survey.new(name: 'survey new',year: 2013,
                             questions_attributes: {'0'=> {desc: 'question no 1',
                                                           options_attributes:{'0'=>{desc: 'option 1'},
                                                                               '1'=>{desc: 'option 2'},
                                                                               '2'=>{desc: 'option 3'},
                                                                               '3'=>{desc: 'option 4'}
                                                          }                   },
                                                    '1'=> {desc: 'question no 2',
                                                           options_attributes:{'0'=>{desc: 'option 1'},
                                                                               '1'=>{desc: 'option 2'},
                                                                               '2'=>{desc: 'option 3'},
                                                                               '3'=>{desc: 'option 4'}
                                                          }                   },
                                                    '2'=> {desc: 'question no 3',
                                                           options_attributes:{'0'=>{desc: 'option 1'},
                                                                               '1'=>{desc: 'option 2'},
                                                                               '2'=>{desc: 'option 3'},
                                                                               '3'=>{desc: 'option 4'}
                                                          }                   }
                                                   }
                         )
              }

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
    it 'must assign empty survey object for admin' do
      get :new
      expect(assigns(:survey).new_record?).to eq(true)
    end

    it 'must render the new page for admin' do
      get :new
      expect(response).to render_template :new
      expect(response.status).to eq(200)
    end
=begin
    it 'should not assign empty survey object for normal user' do
      get :new
      expect(assigns(:survey).new_record?).to eq(false)
      expect(response).to redirect_to surveys_path
    end
    
    it 'should not render the new page for normal user' do
      get :new
      expect(response).to redirect_to :index
=end
  end

  describe 'POST #create' do
  
    it 'should create survey with minimum 3 question' do
      
      post :create,{survey: {name: 'survey new',year: 2013,
                             questions_attributes: {'0'=> {desc: 'question no 1',
                                                           options_attributes:{'0'=>{desc: 'option 1'},
                                                                               '1'=>{desc: 'option 2'},
                                                                               '2'=>{desc: 'option 3'},
                                                                               '3'=>{desc: 'option 4'}
                                                          }                   },
                                                    '1'=> {desc: 'question no 2',
                                                           options_attributes:{'0'=>{desc: 'option 1'},
                                                                               '1'=>{desc: 'option 2'},
                                                                               '2'=>{desc: 'option 3'},
                                                                               '3'=>{desc: 'option 4'}
                                                          }                   },
                                                    '2'=> {desc: 'question no 3',
                                                           options_attributes:{'0'=>{desc: 'option 1'},
                                                                               '1'=>{desc: 'option 2'},
                                                                               '2'=>{desc: 'option 3'},
                                                                               '3'=>{desc: 'option 4'}
                                                          }                   }
                                                   }
                   }}
      expect(response).to redirect_to surveys_path
    end
  end

  describe 'PUT #update' do
    it 'should update survey with valid parameters' do
      put :update, {id: survey.id, survey: {name: 'updated survey', year: 2013}}
      expect(response).to redirect_to surveys_path
    end
  end
  
  describe 'DELETE #destroy' do
    it 'must delete the survey' do
      survey.save
      delete :destroy,id: survey.id
      expect(response).to render_template :index
    end
  end

end
