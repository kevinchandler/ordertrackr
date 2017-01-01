class PagesController < ApplicationController
  def home
    render inline: 'Hello World!'
  end
end
