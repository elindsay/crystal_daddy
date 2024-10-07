class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update]
  
    def index
      @pages = Page.order(:day_index)
    end
  
    def show
    end
  
    def edit
      if request.post?
        feedback = params[:feedback]
        # Save feedback if necessary
        redirect_to page_path(@page)
      end
    end
  
    def update
      if @page.update(page_params)
        redirect_to @page, notice: 'Page was successfully updated.'
      else
        render :edit
      end
    end
  
    def generate_weekly
      GenerateWeeklyPagesJob.perform_later
      render json: { message: "Weekly pages generation started." }
    end
  
    private
  
    def set_page
      @page = Page.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render plain: "Page not found", status: 404
    end
  
    def page_params
      params.require(:page).permit(:title, :content) # Add or remove permitted attributes as needed
    end
end