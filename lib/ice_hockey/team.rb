require "ice_hockey/helpers/has_attributes"
require "ice_hockey/helpers/name_sanitization"
require "ice_hockey/league"

module IceHockey
  class Team
    
    include HasAttributes
    include NameSanitization
    
    def initialize(attributes={})
      @players = []
      
      super
    end
    
    # @method name
    # Get the name of this team.
    #
    # @return [String]
    
    # @method name=(value)
    # Set the name of this team.
    #
    # @param [#to_s] value
    # @return [String]
    
    attribute(:name) { |value| sanitize_name(value) }
    
    # @method location
    # Get the location of this team.
    #
    # @return [String]
    
    # @method location=(value)
    # Set the location of this team.
    #
    # @param [#to_s] value
    # @return [String]
    
    attribute(:location) { |value| sanitize_name(value) }
    
    # Get the acronym of this league, generated from the name and/or location.
    #
    # @return [String]
    attr_reader :acronym # TODO: I have no idea how this could be generated. Probaby can't be?
    
    # @method league
    # Get the league this team is in.
    #
    # @return [String]
    
    # @method league=(value)
    # Set the league this team is in.
    #
    # @param [#to_s] value
    # @return [String]
    
    attribute(:league) { |value| value.is_a?(League) ? value : League.new(value) }
    
    # Get all players in this team.
    #
    # @return [<Player>]
    attr_reader :players
    
  end
end
