class User < ApplicationRecord
  attr_accessor :oauth_callback
  attr_accessor :current_password

  validates_presence_of   :email, if: :email_required?
  validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  validates_format_of     :email, with: Devise.email_regexp, allow_blank: true, if: :email_changed?

  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of       :password, within: Devise.password_length, allow_blank: true

  def password_required?
    return false if email.blank? || !email_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    @oauth_callback != true
  end
  has_many :identities, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :posts
  has_many :companies
  has_many :notifications
  # validates :phone_number, presence: true
  # validates_uniqueness_of :phone_number
  validates_uniqueness_of :email

  mount_uploader :avatar, ImageUploader

  GENDER_TYPES = ["","Male", "Female", "Other"]

  def full_name
  	name = "#{first_name} #{last_name}"
    if name.blank? and !identities.blank?
      name = identities.first.name
    elsif name.blank? and !identities.blank?
      name = identities.first.nickname
    end
    return name
  end

  def display_name
    name = first_name
    if name.blank? and identities.blank?
      name = "Profile"
    elsif name.blank?
      name = identities.first.name.split.first
    elsif name.blank?
      name = identities.first.nickname.split.first
    end
    return name
  end

  def twitter
    identities.where( :provider => "twitter" ).first
  end

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_APP_ID']
      config.consumer_secret     = ENV['TWITTER_APP_SECRET']
      config.access_token        = twitter.accesstoken
      config.access_token_secret = twitter.secrettoken
    end
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

end
