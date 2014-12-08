class RequestsController < SecureController
  # GET /requests
  # GET /requests.json
  def admin_index
	 
	 @requests = Request.where(status: 0).order("requests.created_at DESC")
	 respond_to do |format|
	 format.html # admin_index.html.erb
         format.json { render json: @requests}
	end
  end

  def index
    is_admin = current_user.is_admin
    
    if is_admin
      redirect_to :action=>'admin_index'
    else
      @requests = Request.where(user_id: current_user.id).order("requests.created_at DESC")
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
      end
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(params[:request])
    @request.user = current_user
    respond_to do |format|
    @time1 = @request.start
    @time2 = @request.end
    @request.minutes = TimeDifference.between(@time1, @time2).in_minutes
    @request.created_at=Time.now
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    Rails.logger=Logger.new(STDOUT)

    
    respond_to do |format|
    @request = Request.find(params[:id])
      
    if @request.update_attributes(params[:request])
      if @request.status==1
        
        logger.info "timesheet updated"
        Timesheet.create(date: @request.date, clockin: @request.start, clockout: @request.end,minutes: @request.minutes, user: @request.user,request_type: @request.request_type)
        
      end

      is_admin = current_user.is_admin
      if is_admin 
	if @request.status==0
	  format.html { redirect_to :back, notice: 'Request Updated' }  
	else   
	  logger.info "inside notice"
          format.html { redirect_to @request, notice: 'Request Updated' }  
	end     
      else
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      end

    else
      is_admin = current_user.is_admin
      if is_admin
        Rails.logger.info(@request.errors.messages.inspect)
        format.html { render action: "admin_index" }
        format.json { render json: @request.errors, status: :unprocessable_entity }

      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end 
    end
    
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end
end
