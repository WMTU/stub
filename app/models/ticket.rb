class Ticket < ActiveRecord::Base
  before_create :generate_hash

  private

  def generate_hash
    begin
      self.hash = SecureRandom.hex
    end while self.class.exists?(hash: token)
  end
end
