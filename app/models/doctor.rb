class Doctor < User
  validates_presence_of :crm, :expertise

  validates_uniqueness_of :crm

  validates_format_of :expertise, :with => /\A[a-zA-Z\s]+\z/, :message => "Apenas letras e espaços são permitidos"
  validates_format_of :crm, :with => /\A[0-9]{7}+\z/, :message => "O CRM deve conter 7 números"

  validates_length_of :expertise, :minimum => 3, :message => "Mínimo de 3 caracteres"

  has_many :appointments, :dependent => :destroy

  def doctor_name_expertise
    "#{name} - #{expertise}"
  end

end