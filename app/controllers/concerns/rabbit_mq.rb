module RabbitMq
  included do
    after_action :clsoe_channel
  end

  def mq_channel
    @channel ||= RABBIT_MQ.create_channel
  end

  def close_channel
    mq_channel.close
  end
end
