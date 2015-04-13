class Ticket < ActiveRecord::Base
  before_create :generate_hash
  self.inheritance_column = :na

  private

  def generate_hash
    begin
      self.uuid = SecureRandom.hex
    end while self.class.exists?(uuid: uuid)
  end
end
