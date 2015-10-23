require "ice_hockey/has_attributes"
require "ice_hockey/team"

module IceHockey
  module NHL
    class StatScraper
      
      include HasAttributes
      
      # http://rangers.nhl.com/club/stats.htm?season=20142015
      URL = "http://%{team_name}.nhl.com/club/stats.htm?season=%{season_start_year}%{season_end_year}"
      
      def initialize(attributes={})
        # @season_start_year = Time.now.year # TODO: Figure out if there's a set date hockey regular season starts to determine this.
        
        super
      end
      
      attribute(:team) { |value| value.is_a?(Team) ? value || Team.new(value) }
      
      attribute(:season_start_year) do
        value = value.to_i
        # value = 1997 if value < 1997 # TODO
        
        @season_end_year = value + 1
        
        value
      end
      
      attribute(:season_end_year) do
        value = value.to_i
        # value = 1998 if value < 1998 # TODO
        
        @season_start_year = value - 1
        
        value
      end
      
      def url
        URL % {
          team_name:         @team.name,
          season_start_year: @season_start_year,
          season_end_year:   @season_end_year
        }
      end
      
    end
  end
end
