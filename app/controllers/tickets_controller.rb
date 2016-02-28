class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :delete]

  def index
    @tickets = Ticket.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tickets }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new ticket_params

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find params[:id]
  end

  def ticket_params
    params.require(:ticket).permit(
      :name,
      :event_id,
      :zpl
    )
  end
end
