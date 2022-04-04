class Patient < User
  validates_presence_of :birthday, :address
  validates :birthday, date: { before: Proc.new { Date.today }, :message => "A data de nascimento não pode ser maior que a data atual"}

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  has_many :appointments, dependent: :destroy

  def with_address
    build_address if address.nil?
    self
  end
end