class Contact < ApplicationRecord
  belongs_to :kind
  
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
end
