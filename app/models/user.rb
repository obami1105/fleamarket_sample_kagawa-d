class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/ #半角英文字・数値・大文字・小文字含む
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A[ぁ-んー－]+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: VALID_EMAIL_REGEX, allow_blank: true}
    validates :password, length: { minimum: 7 ,allow_blank: true}, format: { with: VALID_PASSWORD_REGEX,allow_blank: true}
    validates :first_name, format: { with: VALID_NAME_REGEX, allow_blank: true}
    validates :family_name, format: { with: VALID_NAME_REGEX, allow_blank: true}
    validates :first_name_kana, format: { with: VALID_KANA_REGEX, allow_blank: true}
    validates :family_name_kana, format: { with: VALID_KANA_REGEX, allow_blank: true}
    validates :birth_date
  end

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

  has_one :credit_card, dependent: :destroy
end
