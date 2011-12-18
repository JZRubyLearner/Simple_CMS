class PagesController < ApplicationController

  layout 'admin'

  def index
    list
    render('list')
  end

  def list
    @pages = Page.order("pages.position ASC")
  end


  def show
    @page = Page.find(params[:id])

  end

  def new
    @page = Page.new(:name => "default")
    @page_count = Page.count+1
    @subjects = Subject.order("subjects.position ASC")


  end

  def create
    #instantiate a new object
    @page = Page.new(params[:page])
    @page_count = Page.count+1


    if @page.save
      flash[:notice] = "Page Created"
      redirect_to(:action=> 'list')
    else
      @page_count = Page.count+1
      @subjects = Subject.order("subjects.position ASC")
      # if fails, redisplay the new template

      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count+1
    @subjects = Subject.order("subjects.position ASC")

  end

  def update
    #find object
    @page = Page.find(params[:id])
    @page_count = Page.count+1

    #update the object
    @page.update_attributes(params[:page])

    if @page.save
       # if save succeeds, redirect to list
      flash[:notice] = "Page Updated"
      redirect_to(:action=> 'show', :id => @page.id)
    else
      # if fails, redisplay the new template
      @page_count = Page.count+1

      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])

  end

  def destroy
    Page.find(params[:id]).destroy
    flash[:notice] = "Page Destroyed"
    redirect_to(:action=> 'list')
  end



end
