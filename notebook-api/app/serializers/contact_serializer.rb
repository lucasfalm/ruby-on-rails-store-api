class ContactSerializer < ActiveModel::Serializer
  attributes(:id, :name, :email, :birthdate, :kind)

  def attributes(*args)
    h = super(*args)
    h[:birthdate] =  (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:kind] = object.kind.description
    h[:phones] = object.phones.map(&:number)
    h[:street] = object.address.street
    h[:city] = object.address.city
    h
  end
end
