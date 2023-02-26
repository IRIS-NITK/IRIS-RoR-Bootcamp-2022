class MytypesController < ApplicationController
  before_action :set_mytype, only: %i[ show edit update destroy ]

  # GET /mytypes or /mytypes.json
  def index
    @mytypes = Mytype.all
  end

  # GET /mytypes/1 or /mytypes/1.json
  def show
  end

  # GET /mytypes/new
  def new
    @mytype = Mytype.new
  end

  # GET /mytypes/1/edit
  def edit
  end

  # POST /mytypes or /mytypes.json
  def create
    @mytype = Mytype.new(mytype_params)

    respond_to do |format|
      if @mytype.save
        format.html { redirect_to activities_path, notice: "New Activity was successfully created." }
        format.json { render :show, status: :created, location: @mytype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mytype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mytypes/1 or /mytypes/1.json
  def update
    respond_to do |format|
      if @mytype.update(mytype_params)
        format.html { redirect_to mytype_url(@mytype), notice: "Mytype was successfully updated." }
        format.json { render :show, status: :ok, location: @mytype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mytype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mytypes/1 or /mytypes/1.json
  def destroy
    @mytype.destroy

    respond_to do |format|
      format.html { redirect_to mytypes_url, notice: "Mytype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mytype
      @mytype = Mytype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mytype_params
      params.require(:mytype).permit(:man)
    end
end
