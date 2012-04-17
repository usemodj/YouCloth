class Cloth < ActiveRecord::Base
  belongs_to :cloth_item
  belongs_to :wash
  
  def unit_price=(num)
    #self.number.gsub(/[^\d\.]/, '').to_f
    num.gsub!(/\D/,'') if num.is_a?(String)
    self[:unit_price] = num.to_i
  end
  
  def repair_price=(num)
    num.gsub!(/\D/,'') if num.is_a?(String)
    self[:repair_price] = num.to_i
  end

  def count=(num)
    num.gsub!(/\D/,'') if num.is_a?(String)
    self[:count] = num.to_i
  end
  
end
