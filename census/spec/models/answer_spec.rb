require 'spec_helper'

describe Answer do
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
    
  it '' do
    
  end

end
