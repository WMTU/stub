class Token < ActiveRecord::Base
  before_create :generate_token
  belongs_to :user

  private

  def generate_token
    begin
      self.hash = SecureRandom.hex
    end while self.class.exists?(hash: token)
  end
end
