class SectionsController < ApplicationController


  layout 'admin'

  def index
    list
    render('list')
  end

  def list
    @sections = Section.order("sections.position ASC")

  end


  def show
    @section = Section.find(params[:id])

  end

  def new
    @section = Section.new(:name => "default")

  end

  def create
    #instantiate a new object
    @section = Section.new(params[:section])
    if @section.save
      flash[:notice] = "Section Created"
      redirect_to(:action=> 'list')
    else
      # if fails, redisplay the new template
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])

  end

  def update
    #find object
    @section = Section.find(params[:id])
    #update the object
    @section.update_attributes(params[:section])

    if @section.save
       # if save succeeds, redirect to list
      flash[:notice] = "Section Updated"
      redirect_to(:action=> 'show', :id => @section.id)
    else
      # if fails, redisplay the new template
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])

  end

  def destroy
    Section.find(params[:id]).destroy
    flash[:notice] = "Section Destroyed"
    redirect_to(:action=> 'list')
  end



end
