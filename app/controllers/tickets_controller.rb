class TicketsController < ApplicationController
  def index
  end

  def band
  end

  def dj
  end

  def both
  end

  def stats
    @all = Ticket.order('created_at DESC')
    @all_total = @all.count
    @all_types = @all.group(:type).count

    @last_year = Ticket.where(created_at: (Time.now - 1.year)..(Time.now))
    @ly_recent_tickets = @last_year.order('created_at DESC').limit(5)
    @ly_total = @last_year.count
    @ly_types = @last_year.group(:type).count
  end
end
