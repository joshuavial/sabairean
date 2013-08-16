class PagesController < ApplicationController
  def home
  end

  def about
  end

  def app
    render layout: 'app'
  end
end
