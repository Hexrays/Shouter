class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :username

  attr_accessor :password
  before_save :encrypt_password

  validates_presence_of :email, :first_name, :last_name, :password, :username,  :on => :create
  validates_confirmation_of :password
  validates :username, :uniqueness => true
  validates :email, :uniqueness => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_many :shouts

  def self.authenticate(email, password)
  	user = find_by_email(email)
  	if user && user.password_hash = BCrypt::Engine.hash_secret(password, user.password_salt)
  		user
  	else
  		nil
  	end
  end

  def fname
  	"#{first_name} #{last_name}"
  end

  def encrypt_password
  	if password.present?
  		self.password_salt = BCrypt::Engine.generate_salt
  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  	end
  end
end
