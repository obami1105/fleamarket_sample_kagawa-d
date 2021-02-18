class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :nickname, :birth_date, presence: true
  validates :password, presence: true, length: { minimum: 7 }

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :family_name, presence: true, format: { with: VALID_NAME_REGEX }

  VALID_KANA_REGEX = /\A[ぁ-んー－]+\z/
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :family_name_kana, presence: true, format: { with: VALID_KANA_REGEX }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  has_one :destination, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns}
  end

end
