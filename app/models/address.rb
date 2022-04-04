class Address < ApplicationRecord
  belongs_to :patient
  validates_presence_of :postal_code, :state, :city, :neighborhood, :street, :number

  validates_format_of :city, :with => /\A[a-zA-Z\s]+\z/, :message => "Apenas letras e espaços são permitidos"
  validates_format_of :number, :with => /\A[0-9]+\z/, :message => "Apenas números são permitidos"
  validates_format_of :neighborhood, :with => /\A[a-zA-Z\s]+\z/, :message => "Apenas letras e espaços são permitidos"
  validates_format_of :street, :with =>  /\A[a-zA-Z\d ]*$\z/, :message => "Apenas letras e espaços são permitidos"
  validates_format_of :postal_code, :with => /\A[0-9]{8}\z/, :message => "O CEP deve conter 8 números"

  validates_length_of :city, :minimum => 3, :message => "Mínimo de 3 caracteres"
  validates_length_of :neighborhood, :minimum => 3, :message => "Mínimo de 3 caracteres"
  validates_length_of :street, :minimum => 3, :message => "Mínimo de 3 caracteres"
  validates_length_of :number, :minimum => 1, :message => "Mínimo de 1 número"

end
