class User < ApplicationRecord
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  include SoftDeletable

  belongs_to :room

  def created_date
    DateFormat.new(created_at)
  end

  def birth_day
    DateFormat.new(birthday)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
