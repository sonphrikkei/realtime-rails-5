class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  has_many :chatrooms, through: :messages

  validates :username, presence: true, uniqueness: true

  def online
    # REDIS.sadd("online", self.username)
    # AppearanceBroadcastJob.perform_later list
  end

  def offline
    # REDIS.srem("online", self.username)
    # AppearanceBroadcastJob.perform_later list
  end

  def list
    # REDIS.smembers("online")
  end
end
