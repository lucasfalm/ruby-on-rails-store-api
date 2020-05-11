class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :phones do
    link(:related) { contact_phones_url(object.id) }
  end

  belongs_to :kind do
    link(:related) { contact_kind_url(object.id) }
  end

  has_one :address do
    link(:related) { contact_address_url(object.id) }
  end

  meta do 
    {
      author: 'Lucas F.'
    } 
  end

  link(:self) { contact_url(object.id) }

  def attributes(*args)
    h = super(*args)
    h[:birthdate] =  object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
