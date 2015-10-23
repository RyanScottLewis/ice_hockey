require "ice_hockey/helpers/has_attributes"
require "ice_hockey/helpers/name_sanitization"
require "ice_hockey/team"

module IceHockey
  class Player
    
    include HasAttributes
    include NameSanitization
    
    # @method name
    # Get the name of this player.
    #
    # @return [String]
    
    # @method name=(value)
    # Set the name of this player.
    #
    # @param [#to_s] value
    # @return [String]
    
    attribute(:name) { |value| sanitize_name(value) }
    
    # @method team
    # Get the team of this player.
    #
    # @return [String]
    
    # @method team=(value)
    # Set the team of this player.
    #
    # @param [#to_s] value
    # @return [String]
    
    attribute(:team) { |value| value.is_a?(Team) ? value : Team.new(value) }
    
  end
end
