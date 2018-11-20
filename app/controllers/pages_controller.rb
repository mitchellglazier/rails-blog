class PagesController < ApplicationController
  def index
    #sql select * from pages in database
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    #creates a new page only in memory
    @page = Page.new
  end

  def creates
    @page = Page.new(pages_params)

    if @page.sav
      redirect_to pages_path
    else
      render :new
    end
  end

  private

    def pages_params
      params.require(:page).permit(:title, :body)
    end
end
