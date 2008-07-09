class LogfilesController < ApplicationController
  # GET /logfiles
  # GET /logfiles.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.js   # index.js.erb
      format.xml  { 
      	render :xml => Logfile.all
      }
      format.json {
      	@logfiles = flexigrid_paginate Logfile, %w(type, state, source_file_name, note), params
      	render :json => @logfiles.to_json, :template => false
      }
    end
  end

  # GET /logfiles/1
  # GET /logfiles/1.xml
  def show
    @logfile = Logfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @logfile }
    end
  end

  # GET /logfiles/new
  # GET /logfiles/new.xml
  def new
    @logfile = Logfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @logfile }
    end
  end

  # GET /logfiles/1/edit
  def edit
    @logfile = Logfile.find(params[:id])
  end

  # POST /logfiles
  # POST /logfiles.xml
  def create
    @logfile = Logfile.new(params[:logfile])
    @logfile.user = current_user
    #TODO: identify content_type
    @logfile.type = 'Kismet'
    respond_to do |format|
      if @logfile.save  
        # Se salvar, parsear:
        # TODO: parse 
        @logfile.parse_log(current_user)
        
        flash[:notice] = 'Logfile was successfully created.'
        format.html { redirect_to(@logfile) }
        format.xml  { render :xml => @logfile, :status => :created, :location => @logfile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @logfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /logfiles/1
  # PUT /logfiles/1.xml
  def update
    @logfile = Logfile.find(params[:id])

    respond_to do |format|
      if @logfile.update_attributes(params[:logfile])
        flash[:notice] = 'Logfile was successfully updated.'
        format.html { redirect_to(@logfile) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @logfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /logfiles/1
  # DELETE /logfiles/1.xml
  def destroy
    @logfile = Logfile.find(params[:id])
    @logfile.destroy

    respond_to do |format|
      format.html { redirect_to(logfiles_url) }
      format.xml  { head :ok }
    end
  end
end
