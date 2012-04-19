class MinorsController < ApplicationController
  # GET /minors
  # GET /minors.json
  def index
    @minors = Minor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @minors }
    end
  end

  # GET /minors/1
  # GET /minors/1.json
  def show
    @minor = Minor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @minor }
    end
  end

  # GET /minors/new
  # GET /minors/new.json
  def new
    @minor = Minor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @minor }
    end
  end

  # GET /minors/1/edit
  def edit
    @minor = Minor.find(params[:id])
  end

  # POST /minors
  # POST /minors.json
  def create
    @minor = Minor.new(params[:minor])

    respond_to do |format|
      if @minor.save
        format.html { redirect_to @minor, notice: 'Minor was successfully created.' }
        format.json { render json: @minor, status: :created, location: @minor }
      else
        format.html { render action: "new" }
        format.json { render json: @minor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /minors/1
  # PUT /minors/1.json
  def update
    @minor = Minor.find(params[:id])

    respond_to do |format|
      if @minor.update_attributes(params[:minor])
        format.html { redirect_to @minor, notice: 'Minor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @minor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minors/1
  # DELETE /minors/1.json
  def destroy
    @minor = Minor.find(params[:id])
    @minor.destroy

    respond_to do |format|
      format.html { redirect_to minors_url }
      format.json { head :no_content }
    end
  end
end
