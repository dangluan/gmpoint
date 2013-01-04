class TestsController < ActionController::Base
  # def say_hello
  #    render text: 'ahah'
  #  end
  
  say_hello
  
  def hello
    render :text => "hello world"
  end
end