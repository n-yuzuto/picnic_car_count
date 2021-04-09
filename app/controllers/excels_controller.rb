class ExcelsController < ApplicationController
  before_action :set_excel, only: %i[ show edit update destroy ]

  # GET /excels or /excels.json
  def index
    # Excelに出力したいデータをインスタンス変数に格納する
    @excels = Excel.all

    # 以下、追記
    respond_to do |format|
      format.html
      format.xlsx do
        # ファイル名をここで指定する（動的にファイル名を変更できる）
        response.headers['Content-Disposition'] = "attachment; filename=#{Date.today}.xlsx"
      end
    end
  end

  # GET /excels/1 or /excels/1.json
  def show
  end

  # GET /excels/new
  def new
    @excel = Excel.new
  end

  # GET /excels/1/edit
  def edit
  end

  # POST /excels or /excels.json
  def create
    @excel = Excel.new(excel_params)
    @excel.creator = current_user.username
    respond_to do |format|
      if @excel.save
        format.html { redirect_to @excel, notice: "Excel was successfully created." }
        format.json { render :show, status: :created, location: @excel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @excel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /excels/1 or /excels/1.json
  def update
    respond_to do |format|
      if @excel.update(excel_params)
        format.html { redirect_to @excel, notice: "Excel was successfully updated." }
        format.json { render :show, status: :ok, location: @excel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @excel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excels/1 or /excels/1.json
  def destroy
    @excel.destroy
    respond_to do |format|
      format.html { redirect_to excels_url, notice: "Excel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excel
      @excel = Excel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def excel_params
      params.require(:excel).permit(:day, :place, :content)
    end
end
