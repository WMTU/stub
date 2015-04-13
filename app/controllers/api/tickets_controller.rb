class Api::TicketsController < ApiController
  include RabbitMq

  def band
    render inline: File.open('./zpls/band-night.zpl').read
  end

  def dj
    render inline: File.open('./zpls/dj-night.zpl').read
  end

  def both
    render inline: File.open('./zpls/both-night.zpl').read
  end
end
