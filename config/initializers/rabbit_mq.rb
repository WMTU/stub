require 'bunny'

server = CONFIG[:rabbit_mq]

server_config = {
  host: server[:host],
  port: server[:port],
  user: server[:user],
  pass: server[:pass],
  vhost: server[:vhost],
  read_timeout: 30,
  heartbeat: 2
}

if defined?(PhusionPassenger) # otherwise it breaks rake commands if you put this in an initializer
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    if forked
      # Connect to rabbit mq server
      RABBIT_MQ = Bunny.new server_config
      RABBIT_MQ.start

      # Setup exchange and channel
      INDEXER_CHANNEL = RABBIT_MQ.create_channel
      INDEXER_EXCHANGE = INDEXER_CHANNEL.topic 'echo'
    end
  end
else
  # Connect to rabbit mq server
  begin
    RABBIT_MQ = Bunny.new server_config
    RABBIT_MQ.start

    # Setup exchange and channel
    INDEXER_CHANNEL = RABBIT_MQ.create_channel
    INDEXER_EXCHANGE = INDEXER_CHANNEL.topic 'echo'
  rescue
    Rails.logger.error 'Cannot connect to Rabbit MQ'
  end
end
