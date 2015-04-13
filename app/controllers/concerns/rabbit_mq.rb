module RabbitMq
  extend ActiveSupport::Concern

  included do
    after_action :close_channel
  end

  def mq_channel
    @channel ||= RABBIT_MQ.create_channel
  end

  def close_channel
    mq_channel.close
  end
end
