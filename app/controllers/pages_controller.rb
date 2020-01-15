class PagesController < ApplicationController

  def home
    @languages = Language.all
  end
end
