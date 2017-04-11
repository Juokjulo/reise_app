class MaterialCategory < ApplicationRecord
  has_many :materials, dependent: :destroy
  
  def self.get_form_options
  out = []
    MaterialCategory.order("name ASC").all.each do |a|
      out << [a.name, a.id]
    end 
    out
  end

end
