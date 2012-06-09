class StartupsController < ApplicationController
  # GET /startups
  # GET /startups.json
  def index
    @startups = Startup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @startups }
    end
  end

  # GET /startups/1
  # GET /startups/1.json
  def show
    @startup = Startup.find(params[:id])
    @owner = @startup.user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @startup }
    end
  end

  # GET /startups/new
  # GET /startups/new.json
  def new
    @startup = Startup.new
    @team = @startup.build_team 
    @team.users << current_user 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @startup }
    end
  end

  # GET /startups/1/edit
  def edit
    @startup = Startup.find(params[:id])
  end

  # POST /startups
  # POST /startups.json
  def create
    @startup = current_user.startups.new(params[:startup])
    respond_to do |format|
      if @startup.save
	@leader = @startup.team.team_memberships.find( :first, :conditions => { :user_id => current_user.id})
	@leader.leader = true
        format.html { redirect_to @startup, notice: 'Startup was successfully created.' }
        format.json { render json: @startup, status: :created, location: @startup }
      else
        format.html { render action: "new" }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /startups/1
  # PUT /startups/1.json
  def update
    @startup = Startup.find(params[:id])

    respond_to do |format|
      if @startup.update_attributes(params[:startup])
        format.html { redirect_to @startup, notice: 'Startup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /startups/1
  # DELETE /startups/1.json
  def destroy
    @startup = Startup.find(params[:id])
    @startup.destroy

    respond_to do |format|
      format.html { redirect_to startups_url }
      format.json { head :no_content }
    end
  end
end
