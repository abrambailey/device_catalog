class StylesController < ApplicationController
  # GET /styles
  # GET /styles.json
  def index
    @style = Style.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @styles }
    end
  end

  def create_dashboard
    @style = Style.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @styles }
    end
  end
  
  # GET /styles/1
  # GET /styles/1.json
  def show
    @style = Style.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @style }
    end
  end

  # GET /styles/new
  # GET /styles/new.json
  def new
    @style = Style.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @style }
    end
  end

	def brandsubmit
		@brand = Brand.find_or_create_by_name(params[:style][:brand_name])
		@style = Style.new
		render :partial => 'form3', :locals => {:brand => @brand }
	end
	
  # GET /styles/1/edit
  def edit
    @style = Style.find(params[:id])
    @style.options = YAML.load(@style.options)
  end

  # POST /styles
  # POST /styles.json
  def create
    @brand = Brand.find_or_create_by_name(params[:style][:brand_name])
    @model = Model.where(:name => params[:style][:model_name], :brand_id => @brand.id)
    if @model.empty?
    	@model = Model.create(:name => params[:style][:model_name], :brand_id => @brand.id)
    else 
    	@model = @model.first
  	end
    @submodel = Submodel.where(:name => params[:style][:submodel_name], :model_id => @model.id, :brand_id => @brand.id)
    if @submodel.empty?
    	@submodel = Submodel.create(:name => params[:style][:submodel_name], :model_id => @model.id, :brand_id => @brand.id)
  	else
  		@submodel = @submodel.first
		end
		@style = Style.new(params[:style])
    @style.submodel_id = @submodel.id
    @style.model_id = @model.id
    @style.brand_id = @brand.id
		@stylecheck = Style.where(:name => @style.name, :brand_id => @brand.id, :model_id => @model.id, :submodel_id => @submodel.id)
		if @stylecheck.empty?
			if @style.save
			redirect_to root_path
		  #respond_to do |format|
		  		#format.html redirect_to root_path
		      #format.json { render json: @style, status: :created, location: @style }
		      #format.js
      #end
      else
      	respond_to do |format|
      		format.json { render json: @style.errors, status: :unprocessable_entity }
      		format.js { render 'reload' }
    		end
  		end
    else
    	@style = @stylecheck.first
    	respond_to do |format|
      	format.json { render json: @style.errors, status: :unprocessable_entity }
	    end
	  end
	end

	def styletest
	  @model = Model.find_or_initialize_by_name(params[:model_name])
  	@brand = Brand.find_or_initialize_by_name(params[:brand_name])
  	@submodel = Submodel.find_or_initialize_by_name(params[:submodel_name])
  	@style = Style.where(:name => params[:style_name], :model_id => @model.id, :brand_id => @brand.id, :submodel_id => @submodel.id)
  	if @style.empty?
  		render json: []
		else
			render json: @style
  	end
	end
	
  # PUT /styles/1
  # PUT /styles/1.json
  def update
    @style = Style.find(params[:id])

    respond_to do |format|
      if @style.update_attributes(params[:style])
        format.html { redirect_to root_path, notice: 'Style was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /styles/1
  # DELETE /styles/1.json
  def destroy
    @style = Style.find(params[:id])
    @style.destroy

    respond_to do |format|
      format.html { redirect_to styles_url }
      format.json { head :no_content }
      format.js
    end
  end
  
end
