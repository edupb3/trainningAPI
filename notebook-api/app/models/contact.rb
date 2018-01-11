class Contact < ApplicationRecord
  
  # Associations
  belongs_to :kind
  has_many :phones
  has_one :address
  
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address
  

#   def author
#     "Eduardo"
#   end
  
#   def kind_description
#     self.kind.description
#   end
  
#   def as_json(options={})
#     super(
#       root: true,
#       methods: [:kind_description, :author],
#       include: {kind: {only: :description}},
#       except: [:created_at, :updated_at, :kind_id]
#     )
#   end
#   def to_br
#     { "name": self.name,
#       "email": self.email,
#       "birthdate": I18n.l(self.bithdate)
#     }
#   end
end
