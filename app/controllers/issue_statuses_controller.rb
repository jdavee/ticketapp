class IssueStatusesController < ApplicationController
  before_action :set_issue_status, only: [:show, :edit, :update, :destroy]

  # GET /issue_statuses
  # GET /issue_statuses.json
  def index
    @issue_statuses = IssueStatus.all
  end

  # GET /issue_statuses/1
  # GET /issue_statuses/1.json
  def show
  end

  # GET /issue_statuses/new
  def new
    @issue_status = IssueStatus.new
  end

  # GET /issue_statuses/1/edit
  def edit
  end

  # POST /issue_statuses
  # POST /issue_statuses.json
  def create
    @issue_status = IssueStatus.new(issue_status_params)

    respond_to do |format|
      if @issue_status.save
        format.html { redirect_to @issue_status, notice: 'Issue status was successfully created.' }
        format.json { render :show, status: :created, location: @issue_status }
      else
        format.html { render :new }
        format.json { render json: @issue_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_statuses/1
  # PATCH/PUT /issue_statuses/1.json
  def update
    respond_to do |format|
      if @issue_status.update(issue_status_params)
        format.html { redirect_to @issue_status, notice: 'Issue status was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_status }
      else
        format.html { render :edit }
        format.json { render json: @issue_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_statuses/1
  # DELETE /issue_statuses/1.json
  def destroy
    @issue_status.destroy
    respond_to do |format|
      format.html { redirect_to issue_statuses_url, notice: 'Issue status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_status
      @issue_status = IssueStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_status_params
      params.require(:issue_status).permit(:name)
    end
end
