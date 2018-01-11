class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :bithdate
  
  # Associations
  belongs_to :kind do
    link(:related){ kind_path(object.kind.id) }  
  end
  
  has_many :phones 
  has_one :address
  
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
