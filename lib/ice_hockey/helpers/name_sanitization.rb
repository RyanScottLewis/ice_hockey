module IceHockey
  module Helpers
    
    module NameSanitization
      
      protected
      
      def sanitize_name(value)
        value.to_s.strip.downcase.split.collect(&:capitalize).join(' ')
      end
      
    end
    
  end
end
