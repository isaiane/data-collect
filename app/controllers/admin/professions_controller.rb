class Admin::ProfessionsController < SuperAdminController
  before_action :set_profession, only: [:destroy]

  # GET /admin/professions
  # GET /admin/professions.json
  def index
    if Profession.all.any?
      @professions = Profession.rank(:row_order).all
    else
      @professions = []
    end
    @profession = Profession.new
  end

  # POST /admin/professions
  # POST /admin/professions.json
  def create
    @profession = Profession.new(profession_params)
    respond_to do |format|
      if @profession.save
        format.html { redirect_to professions_url, notice: t("helpers.action.created", model: t("profession")) }
        format.json { render :index, status: :created, location: @profession }
      else
        format.html { render :index }
        format.json { render json: @profession.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_row_order
    @profession = Profession.find(rank_params[:item_id])
    @profession.row_order_position = rank_params[:row_order_position]
    @profession.save
    render nothing: true
  end

  def update_multiple
    profession.update(params[:professions].keys, params[:professions].values)
    respond_to do |format|
      format.html { head :no_content }
      format.json { head :no_content }
    end
  end

  # DELETE /admin/professions/1
  # DELETE /admin/professions/1.json
  def destroy
    @profession.destroy
    respond_to do |format|
      format.html { redirect_to professions_url, notice: t("helpers.action.destroyed", model: t("profession")) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profession
      @profession = Profession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profession_params
      params.require(:profession).permit(:name)
    end

    def rank_params
      params.require(:item).permit(:item_id, :row_order_position)
    end
end
