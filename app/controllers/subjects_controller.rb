class SubjectsController < ApplicationController

  layout 'admin'

  def index
    list
    render('list')
  end

  def list
    @subjects = Subject.order("subjects.position ASC")

  end


  def show
    @subject = Subject.find(params[:id])


  end

  def new
    @subject = Subject.new(:name => "default")
    @subject_count = Subject.count + 1
  end

  def create
    #instantiate a new object
    @subject = Subject.new(params[:subject])
    if @subject.save
      flash[:notice] = "Subject Created"
      redirect_to(:action=> 'list')
    else
      # if fails, redisplay the new template
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count + 1
  end

  def update
    #find object
    @subject = Subject.find(params[:id])
    #update the object
    @subject.update_attributes(params[:subject])

    if @subject.save
       # if save succeeds, redirect to list
      flash[:notice] = "Subject Updated"
      redirect_to(:action=> 'show', :id => @subject.id)
    else
      # if fails, redisplay the new template
      @subject_count = Subject.count + 1
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])

  end

  def destroy
    Subject.find(params[:id]).destroy
    flash[:notice] = "Subject Destroyed"
    redirect_to(:action=> 'list')
  end



end
