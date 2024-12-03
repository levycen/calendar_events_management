class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Cambia el campo de autenticación a 'phone'
  def self.find_for_database_authentication(warden_conditions)
    where(phone_number: warden_conditions[:phone_number]).first
  end

  validates :phone_number, presence: true, uniqueness: true

  # Desactiva la validación automática de email
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
