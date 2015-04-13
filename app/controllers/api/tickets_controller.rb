class Api::TicketsController < ApiController
  include RabbitMq

  def band
    head :no_content
  end

  def dj
    head :no_content
  end

  def both
    head :no_content
  end
end
