class PagesController < ApplicationController
  def index
    @title = "Start"
  end

  def kontakt
    @title = "Kontakt"
  end

  def om
    @title = "Om oss"
  end

end
