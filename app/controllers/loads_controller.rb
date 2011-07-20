class LoadsController < ApplicationController
  # GET /loads/1
  # GET /loads/1.xml
  def show
    @load = Work.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
    end
  end

  def modificar
    @load = Load.find(:first, :conditions => {:work_id => params[:id] })
    @work = Work.find(params[:id])
    @contenedores = Position.find(:all, :conditions => {:work_id => params[:id] }, :order => "id asc")
    
    #Defino los limites del avion
    @min = 1
    if @work.plane == "737-300F"
        @max = 9
    elsif @work.plane == "737-400SF"
        @max = 10
    else
        @max = 9
    end
    #END - Defino los limites del avion
    
    
    if params[:position].nil?
      if @work.plane == "737-300F"
          @position = 9
      elsif @work.plane == "737-400SF"
          @position = 10
      else
          @position = 9
      end
            
    else
      @position = params[:position].to_i
    end
    
    @nameB = @load.P1 if @position == 1
    @nameB = @load.P2 if @position == 2
    @nameB = @load.P3 if @position == 3
    @nameB = @load.P4 if @position == 4
    @nameB = @load.P5 if @position == 5
    @nameB = @load.P6 if @position == 6
    @nameB = @load.P7 if @position == 7
    @nameB = @load.P8 if @position == 8
    @nameB = @load.P9 if @position == 9
    @nameB = @load.P10 if @position == 10
    @nameB = @load.P11 if @position == 11
    @nameB = @load.P12 if @position == 12
    if @nameB.nil?
        @nameB = ""
    end

    respond_to do |format|
        format.html # show.html.erb
    end
  end
  
  # PUT /loads/1
  # PUT /loads/1.xml
  def update
    @load = Load.find(:first, :conditions => {:work_id => params[:id] })
    
    if params[:position].nil?
        @position = 9
    else
        @position = params[:position].to_i
    end
    
    @load.P1 = params[:nameA]+params[:nameB] if @position == 1
    @load.P2 = params[:nameA]+params[:nameB] if @position == 2
    @load.P3 = params[:nameA]+params[:nameB] if @position == 3
    @load.P4 = params[:nameA]+params[:nameB] if @position == 4
    @load.P5 = params[:nameA]+params[:nameB] if @position == 5
    @load.P6 = params[:nameA]+params[:nameB] if @position == 6
    @load.P7 = params[:nameA]+params[:nameB] if @position == 7
    @load.P8 = params[:nameA]+params[:nameB] if @position == 8
    @load.P9 = params[:nameA]+params[:nameB] if @position == 9
    @load.P10 = params[:nameA]+params[:nameB] if @position == 10
    
    @load.save
    
    if params[:nextposition].nil?
        @position = 9
    else
        @position = params[:nextposition].to_i
    end

    respond_to do |format|
      if @load.update_attributes(params[:load])
        format.html { redirect_to('/loads/'+@load.id.to_s+'/modificar?position='+@position.to_s, :notice => 'Load was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @load.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loads/1
  # DELETE /loads/1.xml
  def cargar
    @load = Load.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { head :ok }
    end
  end
end