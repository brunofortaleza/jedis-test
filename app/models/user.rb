class User < ApplicationRecord
  include UserValidator

  mount_uploader :image, ImageUploader

  has_one :address, :dependent => :destroy

  accepts_nested_attributes_for :address

  validates :full_name, :cpf, :cns, :email, :birth_date, :phone_number, :image, :status, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :cns_is_valid?, :cpf_is_valid?, :birth_date_valid?

  def cns_is_valid?
    errors.add(:cns, 'inválido') unless validate_cns_size(cns)
  end

  def cpf_is_valid?
    errors.add(:cpf, 'inválido') unless CPF.valid?(cpf)
  end

  def birth_date_valid?
    date_time = birth_date.to_datetime
    year = date_time.year
    actual_year = DateTime.now.year

    errors.add(:birth_date, 'inválida') if year > actual_year || (actual_year - year) > 120
  end

  def birth_date
    return unless self[:birth_date].present?

    I18n.l(self[:birth_date], format: :default_date)
  end


  def self.ransackable_attributes(auth_object = nil)
    %w[full_name email cpf cns email birth_date phone_number]
  end

  def self.ransackable_associations(auth_object = nil)
    ["address"]
  end
end
