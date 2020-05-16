module ErrorSerializer
  def self.serialize(errors)
    return if errors.nil?
      json = {}
      new_hash = errors.to_h.map do |k,v|
        { id: k, title: v }
      end.flatten
      json[:errors] = new_hash
      json  
  end
end