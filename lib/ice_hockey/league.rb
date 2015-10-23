require "ice_hockey/helpers/has_attributes"
require "ice_hockey/helpers/name_sanitization"

module IceHockey
  class League
    
    include HasAttributes
    include NameSanitization
    
    def initialize(attributes={})
      @teams = []
      
      super
    end
    
    # @method name
    # Get the name of this league.
    #
    # @return [String]
    
    # @method name=(value)
    # Set the name of this league.
    #
    # @param [#to_s] value
    # @return [String]
    
    attribute(:name) do |value|
      value = sanitize_name(value)
      @acronym = generate_acronym(value)
      
      value
    end
    
    # Get the acronym of this league, generated from the name.
    #
    # @return [String]
    attr_reader :acronym
    
    # Get all teams in this league.
    #
    # @return [<Team>]
    attr_reader :teams
    
    protected
    
    def generate_acronym(name)
      name.split.collect { |value| value[0] }.join
    end
    
  end
end
