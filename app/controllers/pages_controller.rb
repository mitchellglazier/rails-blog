class PagesController < ApplicationController
#reads all the pages
  def index
    #sql select * from pages in database
    @pages = Page.all
  end
#read a single page
  def show
    @page = Page.find(params[:id])
  end
#read, renders a form for the new page
  def new
    #creates a new page only in memory
    @page = Page.new
  end
#creates, creates a new page
  def creates
    @page = Page.new(pages_params)

    if @page.sav
      redirect_to pages_path
    else
      render :new
    end
  end
#read, renders the edit form
  def edit
    @page = Page.find(params[:id])
  end
#updates updats a page
  def update
    @page = Page.find(params[:id])

      if @page .update(pages_params)
        redirect_to pages_path
      else
        render :edit
      end
    end

def destroy
  page.find(params[:id]).destroy
  redirect_to pages_path
end

  private

    def pages_params
      params.require(:page).permit(:title, :body)
    end
end
