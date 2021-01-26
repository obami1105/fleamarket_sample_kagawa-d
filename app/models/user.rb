class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birth_date, presence: true
  validates :password, presence: true, length: { minimum: 7 }

  VALID_FIRSTNAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true, format: { with: VALID_FIRSTNAME_REGEX }

  VALID_FAMILYNAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :family_name, presence: true, format: { with: VALID_FAMILYNAME_REGEX }

  VALID_FIRSTNAMEKANA_REGEX = /\A[ぁ-んー－]+\z/
  validates :first_name_kana, presence: true, format: { with: VALID_FIRSTNAMEKANA_REGEX }

  VALID_FAMILYNAMEKANA_REGEX = /\A[ぁ-んー－]+\z/
  validates :family_name_kana, presence: true, format: { with: VALID_FAMILYNAMEKANA_REGEX }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  has_one :destination, dependent: :destroy
end
