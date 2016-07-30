class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  autocomplete :tool, :name, :full => true

  # GET /tools
  # GET /tools.json
  def index
    @tools = Tool.all
  end

  # GET /tools/1
  # GET /tools/1.json
  def show
  end

  # GET /tools/new
  def new
    @tool = Tool.new
    @tool.reviews.build
    # @review = Review.new
  end

  # GET /tools/1/edit
  def edit
  end

  # POST /tools
  # POST /tools.json
  def create
    @tool = Tool.where(name: params[:tool][:name]).first_or_initialize
    @tool.save
    @review = Review.new(review_params)
    @review.save
    redirect_to tools_path
  end

  # PATCH/PUT /tools/1
  # PATCH/PUT /tools/1.json
  def update
    respond_to do |format|
      if @tool.update(tool_params)
        format.html { redirect_to @tool, notice: 'Tool was successfully updated.' }
        format.json { render :show, status: :ok, location: @tool }
      else
        format.html { render :edit }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tools/1
  # DELETE /tools/1.json
  def destroy
    @tool.destroy
    respond_to do |format|
      format.html { redirect_to tools_url, notice: 'Tool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @tools = Tool.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tool_params
      params.require(:tool).permit(:name)
    end

    def review_params
      params.require(:tool).require(:review).permit(:review).merge(user_id: current_user.id, tool_id: @tool.id)
    end
end
