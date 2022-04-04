class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :document
  validates_uniqueness_of :document
  validates_format_of :name, :with => /\A[a-zA-Z\s]+\z/, :message => "Apenas letras e espaços são permitidos"
  validates_length_of :name, :minimum => 3, :message => "O nome deve ter no mínimo 3 caracteres"
  validates_format_of :document, :with => /\A[0-9]{11}+\z/, :message => "O CPF deve conter 11 números"
  enum role: [:patient, :doctor]
  has_many :appointments, dependent: :destroy
end
