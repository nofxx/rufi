class ApsController < ApplicationController
  # GET /aps
  # GET /aps.xml
  def index
    @aps = Ap.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aps }
    end
  end

  # GET /aps/1
  # GET /aps/1.xml
  def show
    @ap = Ap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ap }
    end
  end

  # GET /aps/new
  # GET /aps/new.xml
  def new
    @ap = Ap.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ap }
    end
  end

  # GET /aps/1/edit
  def edit
    @ap = Ap.find(params[:id])
  end

  # POST /aps
  # POST /aps.xml
  def create
    @ap = Ap.new(params[:ap])

    respond_to do |format|
      if @ap.save
        flash[:notice] = 'Ap was successfully created.'
        format.html { redirect_to(@ap) }
        format.xml  { render :xml => @ap, :status => :created, :location => @ap }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aps/1
  # PUT /aps/1.xml
  def update
    @ap = Ap.find(params[:id])

    respond_to do |format|
      if @ap.update_attributes(params[:ap])
        flash[:notice] = 'Ap was successfully updated.'
        format.html { redirect_to(@ap) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aps/1
  # DELETE /aps/1.xml
  def destroy
    @ap = Ap.find(params[:id])
    @ap.destroy

    respond_to do |format|
      format.html { redirect_to(aps_url) }
      format.xml  { head :ok }
    end
  end
end
