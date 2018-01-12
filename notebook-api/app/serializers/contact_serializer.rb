class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :bithdate
  
  # Associations
  belongs_to :kind do
    link(:related){  contact_kind_path (object.id) }  
  end
  
  has_many :phones do
    link(:related){  contact_phones_path (object.id) }  
  end
  
  has_one :address do
    link(:related){  contact_address_path (object.id) }  
  end
  
  link(:self){ contact_path(object.id) }
  
  meta do
    {author: "Eduardo Batista"}
  end
  
  def attributes(*args)
    h = super(*args);
    # pt-BR --> h[:bithdate]  = (I18n.l(object.bithdate) unless object.bithdate.blank?)
    h[:bithdate]  = object.bithdate.to_time.iso8601 unless object.bithdate.blank?
    h
  end
  
  
end
