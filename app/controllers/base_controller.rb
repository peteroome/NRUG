class BaseController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: @bookmarks }
    end
  end
end