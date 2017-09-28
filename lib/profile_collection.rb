class ProfileCollection
  attr_accessor :profiles

  def initialize(profiles = [])
    @profiles = profiles
  end

  # ASSUMPTION: This method currently assumes that it will not be given an attribute that is invalid
  def sort!(sort_by_attributes = ['last_name'], order = 'DESC')
    if order == 'ASC'
      profiles.sort! {|a,b| sort_by_attributes.map{|x| a.send(x)} <=> sort_by_attributes.map{|x| b.send(x)}}
    elsif order == 'DESC'
      profiles.sort! {|a,b| sort_by_attributes.map{|x| b.send(x)} <=> sort_by_attributes.map{|x| a.send(x)}}
    end
  end

  def to_json
    '[' + profiles.map(&:to_json).join(', ') + ']'
  end
end
