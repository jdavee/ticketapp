class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
#  before_action :authenticate_user!

  # GET /tickets
  # GET /tickets.json
  def index
    @q = Ticket.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @tickets = @q.result.includes(:project, :user, :issue_type, :issue_status).paginate(:page => params[:page], :per_page => 5)
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @project_items = []
    @project_all = Project.all.collect

    @project_all.each do |x|
      @project_items << {value: x.id, text: x.name}
    end

    @user_items = []
    @user_all = User.all.collect

    @user_all.each do |u|
      @user_items << {value: u.id, text: "#{u.first_name} #{u.last_name}"}
    end

    @issue_type_items = []
    @issue_type_all = IssueType.all.collect

    @issue_type_all.each do |it|
      @issue_type_items << {value: it.id, text: it.name}
    end

    @issue_status_items = []
    @issue_status_all = IssueStatus.all.collect

    @issue_status_all.each do |is|
      @issue_status_items << {value: is.id, text: is.name}
    end
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  #SEARCH


  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:user_id, :issue_type_id, :issue_status_id, :name, :comment, :project_id, :issue_status_name, :project_name)
    end

end
