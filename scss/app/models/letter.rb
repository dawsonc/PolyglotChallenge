class Letter < ActiveRecord::Base
  validates :body, presence: true

  def self.most_recent
    Letter.order(:created_at).last
  end
end
