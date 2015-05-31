require 'bunny'

server = CONFIG[:rabbit_mq]

if defined?(PhusionPassenger) # otherwise it breaks rake commands if you put this in an initializer
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    if forked
      # Connect to rabbit mq server
      RABBIT_MQ = Bunny.new "amqp://#{server[:user]}:#{server[:pass]}@#{server[:host]}:#{server[:port]}/#{server[:vhost]}", read_timeout: 30, heartbeat: 2
      RABBIT_MQ.start

      # Setup exchange and channel
      INDEXER_CHANNEL = RABBIT_MQ.create_channel
      INDEXER_EXCHANGE = INDEXER_CHANNEL.topic 'echo'
    end
  end
else
  # Connect to rabbit mq server
  begin
    RABBIT_MQ = Bunny.new "amqp://#{server[:user]}:#{server[:pass]}@#{server[:host]}:#{server[:port]}/#{server[:vhost]}", read_timeout: 30, heartbeat: 2
    RABBIT_MQ.start

    # Setup exchange and channel
    INDEXER_CHANNEL = RABBIT_MQ.create_channel
    INDEXER_EXCHANGE = INDEXER_CHANNEL.topic 'echo'
  rescue
    Rails.logger.error "Cannot connect to Rabbit MQ"
  end
end
