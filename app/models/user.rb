class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :statuses

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :profileName, presence: true,
                          uniqueness: true,
                          format: {
                            with: /\A[a-zA-Z\-\_]+\Z/,
                            message: "Must be formatted correctly."
                          }

  def full_name
  	firstName + " " + lastName
  end

  def gravatar_url
    stripped_email = email.strip
    lowercase_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(lowercase_email)

    "http//gravatar.com/avatar/#{hash}"
  end
end
#/a-zA-Z0-9_-/
#\A[a-zA-Z\-\_]+\Z