class Api::TicketsController < ApiController
  def band
    Ticket.create(type: 'band')
    render inline: File.open('./zpls/band-night.zpl').read
  end

  def dj
    Ticket.create(type: 'dj')
    render inline: File.open('./zpls/dj-night.zpl').read
  end

  def both
    Ticket.create(type: 'both')
    render inline: File.open('./zpls/both-night.zpl').read
  end
end
