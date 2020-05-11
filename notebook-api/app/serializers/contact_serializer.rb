class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  belongs_to :kind do
    link(:related) { contact_kind_url(object.id) }
  end

  has_many :phones
  has_one :address

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
