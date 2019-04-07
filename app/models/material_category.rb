class MaterialCategory < ApplicationRecord
  has_many :materials, dependent: :destroy
  enum gear_type:  { hiking: 0, tandem: 1}
  
  def self.get_form_options
  out = []
    MaterialCategory.order("name ASC").all.each do |a|
      out << [a.name, a.id]
    end 
    out
  end

end
