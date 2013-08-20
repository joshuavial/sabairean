class PagesController < ApplicationController
  def home
    render layout: 'marketing'
  end

  def about
    render layout: 'marketing'
  end

  def app
    render layout: 'app'
  end

  def contact
    render layout: 'marketing'
  end
end
