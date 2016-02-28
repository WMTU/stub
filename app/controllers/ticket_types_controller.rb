class TicketTypesController < ApplicationController
  before_action :set_ticket_type, only: [:show, :edit, :update, :delete]

  def index
    @ticket_types = TicketType.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket_types }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket_type }
    end
  end

  def new
    @ticket_type = TicketType.new
  end

  def edit
  end

  def create
    @ticket_type = TicketType.new ticket_type_params

    respond_to do |format|
      if @ticket_type.save
        format.html { redirect_to @ticket_type, notice: 'TicketType was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket_type.update(ticket_type_params)
        format.html { redirect_to @ticket_type, notice: 'TicketType was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket_type.destroy
    respond_to do |format|
      format.html { redirect_to event_ticket_types }
      format.json { head :no_content }
    end
  end

  private

  def set_ticket_type
    @ticket_type = TicketType.find params[:id]
  end

  def ticket_type_params
    params.require(:ticket_type).permit(
      :name,
      :event_id,
      :zpl
    )
  end
end
