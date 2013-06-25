class FarmsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show, :index]

def correct_user?(user)
  user == current_user
end

  def index
    @farms = Farm.all
  @farms_grid = initialize_grid(Farm,
  :order => 'created_at',
  :order_direction => 'asc'
)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @farms }
    end
  end

  # GET /farms/1
  # GET /farms/1.json
  def show
  @farm = Farm.find(params[:id])
   @products = @farm.products
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @farm }
    end
  end

  # GET /farms/new
  # GET /farms/new.json
  def new
    @farm = Farm.new
    products = @farm.products.build()

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @farm }
    end
  end

  # GET /farms/1/edit
  def edit
    @farm = Farm.find(params[:id])
  end

  # POST /farms
  # POST /farms.json
  def create
   @farm = current_user.farms.build(params[:farm])

    respond_to do |format|
      if @farm.save
        format.html { redirect_to @user, notice: 'Your Grow Spot was successfully created.' }
        format.json { render json: @user, status: :created, location: @farm }
      else
        format.html { render action: "new" }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /farms/1
  # PUT /farms/1.json
  def update
    @farm = Farm.find(params[:id])

    respond_to do |format|
      if @farm.update_attributes(params[:farm])
        format.html { redirect_to @farm, notice: 'Farm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farms/1
  # DELETE /farms/1.json
  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy

    respond_to do |format|
      format.html { redirect_to farms_url }
      format.json { head :no_content }
    end
  end

def follow
  @farm = Farm.find(params[:id])

  if current_user
    
      current_user.follow(@farm)
      #RecommenderMailer.new_follower(@user).deliver if @user.notify_new_follower
      
  respond_to do |format|
      if @farm.update_attributes(params[:farm])
        format.html { redirect_to @farm, notice: "You are now following #{@farm.name}." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  else
    flash[:error] = "You must <a href='/users/sign_in'>login</a> to follow #{@user.monniker}.".html_safe
  end
end

def unfollow
  @farm = Farm.find(params[:id])

  current_user.stop_following(@farm)

      
  respond_to do |format|
      if @farm.update_attributes(params[:farm])
        format.html { redirect_to @farm, notice: "You are no longer following #{@farm.name}." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  
end
  
end