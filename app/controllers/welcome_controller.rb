class WelcomeController < ApplicationController
  skip_before_action :authenticate_author!
  def index
  end
end
