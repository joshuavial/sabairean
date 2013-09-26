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

  def notify
    ContactMailer.contact(params[:message], params[:subject], params[:email]).deliver
    render layout: 'marketing'
  end
end
