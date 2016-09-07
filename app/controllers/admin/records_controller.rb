class Admin::RecordsController < SuperAdminController
  before_action :set_record, only: [:show, :update, :destroy]

  # GET /admin/records
  # GET /admin/records.json
  def index
    if params[:search]
      @records = Record.search(params[:search], params[:sort], params[:order],params[:page])
    else
      @records = Record.all.paginate(page: params[:page], per_page: 9)
    end
  end

  # GET /admin/records/1
  # GET /admin/records/1.json
  def show
  end

  # GET /admin/records/new
  def new
    @record = Record.new
  end

  # GET /admin/records/1/edit
  def edit
  end

  # POST /admin/records
  # POST /admin/records.json
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: t("helpers.action.created", model: t("record"))  }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/records/1
  # PATCH/PUT /admin/records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: t("helpers.action.updated", model: t("record"))  }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :show }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/records/1
  # DELETE /admin/records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: t("helpers.action.destroyed", model: t("record"))  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:collection_date, :responsible_for_collecting, :medical_record_number, :birthday, :birthplace, :place_residence, :age, :sex, :breed, :schooling, :family_income, :dependent_income, :marital_status, :marital_status_duration, :type_of_residence, :type_of_residence_other, :characterization_of_housing, :characterization_of_housing_other, :profession_id, :situation_nch_sitema, :cause_of_death, :diagnosis_time_and_end_of_treatment_years, :diagnosis_time_and_end_of_treatment_months, :hsct_follow_up_of_the_nhc_years, :hsct_follow_up_of_the_nhc_months, :hla_major_tests, :hla_major_tests_other, :there_examination_icd_10, :there_examination_icd_10_note, :diagnosis_doctor_in_medical_records, :described_comorbidities, :treatments_described, :type_of_hsct, :type_of_hsct_note, :presence_of_gvhd, :forms_of_gvhd, :survival_time_years, :survival_time_months)
    end
end


