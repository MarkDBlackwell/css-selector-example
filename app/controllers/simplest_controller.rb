class SimplestController < ApplicationController
  def index
    flash[:error ]='some error message'
    flash[:notice]='some notice'
  end
end
