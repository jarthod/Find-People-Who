module SessionHelper  
  def associated_ids origin, link
    origin.send(link['assoc'].underscore.pluralize).where(:kind => link['kind']).map {|e| e.send(link['target'].downcase + '_id')}
  end
end
