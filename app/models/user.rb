class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true,
    uniqueness: true,
    format: {with: /.+@.+\..+/}

  validates :nickname, presence: true,
    uniqueness: true,
    length: {maximum: 40},
    format: {with: /\A\w+\z/}

  before_validation :downcase_nickname

  has_many :questions, dependent: :delete_all

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
