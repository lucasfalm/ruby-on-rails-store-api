class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :phones do
    #link(:related) { v2_contact_phones_url(object.id) }
  end

  belongs_to :kind do
    #link(:related) { v2_contact_kind_url(object.id) }
  end

  has_one :address do
    #link(:related) { v2_contact_address_url(object.id) }
  end

  meta do 
    {
      author: 'Lucas F.'
    } 
  end

  #link(:self) { v2_contact_url(object.id) }

  def attributes(*args)
    h = super(*args)
    h[:birthdate] =  object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
