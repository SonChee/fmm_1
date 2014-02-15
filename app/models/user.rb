class User < ActiveRecord::Base
  
  has_many :user_position_in_projects
  has_many :projects, through: :user_position_in_projects
  has_many :logs
  belongs_to :team
  
  attr_accessor :validate_password
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, if: :validate_password
  scope :admins, -> { where(permission: 2)}
  scope :members, -> { where(permission: 1)}
  scope :free_users, -> { where(team_id: nil)}
  scope :team_members, ->(team_id) { where(team_id: team_id)}
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
