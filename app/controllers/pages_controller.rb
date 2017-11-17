class PagesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :home
  
  def index
    @pages = Page.all
  end

  def show
    if params[:permalink]
      @page = Page.find_by_permalink(params[:permalink])
      @pic =  Picture.find(:first, :conditions => "name = 'Promocja' ")
      raise ActiveRecord::RecordNotFound, "Nie ma takiej strony !" if @page.nil?
    else
      @page = Page.find(params[:id])
      @pic =  Picture.find(:first, :conditions => "name = 'Promocja' ")
    end
    
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, :notice => "Successfully created page."
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice  => "Successfully updated page."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url, :notice => "Successfully destroyed page."
  end

  def home
  end
  
end
