require 'spec_helper'

describe HomeController do

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


  describe 'GET #show' do

    it 'must assign survey object' do
      survey.save
      get :show, id: survey.id
      survey=Survey.last
      p survey
      expect(assigns(:survey)).to eq(survey)
    end

    it 'must render the show page' do
      get :show
      expect(response).to render_template :show
      expect(response.status).to eq(200)
    end
  
  end

end
