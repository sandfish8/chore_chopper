class ChoresController < ApplicationController
  
  before_filter :require_family  
  
  # GET /chores
  # GET /chores.xml
  def index
    @chores = @current_family.chores

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chores }
    end
  end

  # GET /chores/1
  # GET /chores/1.xml
  def show
    @chore = Chore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chore }
    end
  end

  # GET /chores/new
  # GET /chores/new.xml
  def new
    @chore = Chore.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chore }
    end
  end

  # GET /chores/1/edit
  def edit
    @chore = Chore.find(params[:id])
  end

  # POST /chores
  # POST /chores.xml
  def create
    @chore = Chore.new(params[:chore])
    @chore.family = @current_family

    respond_to do |format|
      if @chore.save
        format.html { redirect_to(family_chore_url(@current_family, @chore), :notice => 'A Chore was successfully created.') }
        format.xml  { render :xml => @chore, :status => :created, :location => @chore }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chore.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chores/1
  # PUT /chores/1.xml
  def update
    @chore = Chore.find(params[:id])

    respond_to do |format|
      if @chore.update_attributes(params[:chore])
        format.html { redirect_to(family_chore_url(@current_family, @chore), :notice => 'A Chore was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chore.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chores/1
  # DELETE /chores/1.xml
  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy

    respond_to do |format|
      format.html { redirect_to(family_chores_url(@current_family)) }
      format.xml  { head :ok }
    end
  end
end
