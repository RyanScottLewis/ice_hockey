require "ice_hockey/helpers/has_attributes"

module IceHockey
  class Season
    
    include HasAttributes
    
    # @method started_at
    # Get Date this season started.
    #
    # @return [Date]
    
    # @method started_at=(value)
    # Set Date this season started.
    #
    # @param [#to_s] value
    # @return [Date]
    
    attribute(:started_at) { |*values| sanitize_date(values) }
    
    # @method ended_at
    # Get Date this season ended.
    #
    # @return [Date]
    
    # @method ended_at=(value)
    # Set Date this season ended.
    #
    # @param [#to_s] value
    # @return [Date]
    
    attribute(:ended_at) { |*values| sanitize_date(values) }
    
    protected
    
    # Accepts:
    #  Date
    #  String: "3rd Feb 2001"
    #  Array: [2001, 2, 3]
    def sanitize_date(values)
      if values[0].is_a?(Date)
        values[0]
      elsif values[0].is_a?(String)
        Date.parse(values[0])
      else
        Date.new(*values)
      end
    end
    
  end
end
