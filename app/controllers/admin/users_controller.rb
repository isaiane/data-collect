class Admin::UsersController < SuperAdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  # GET /admin/users.json
  def index
    if params[:search]
      @users = User.search(params[:search], params[:sort], params[:order],params[:page])
    else
      @users = User.all.paginate(page: params[:page], per_page: 9)
    end
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @user = User.new
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t("helpers.action.created", model: t("user")) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t("helpers.action.updated", model: t("user")) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :show }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: t("helpers.action.destroyed", model: t("user")) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :lastname, :slug, :locale, :phone_number, :rule, :profile_image, :password, :password_confirmation, :account_id)
    end
end
