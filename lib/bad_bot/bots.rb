module BadBot
  require 'singleton' 

  # Bots list
  #
  #
  class Bots
    include Singleton

    def initialize
      @bots = ['msnbot', 'googlebot', 'slurp', 'yahoo']
    end

    # Public: Configures the search robots array:
    # Example
    #   BadBot.Bot.insance.setup do |bots|
    #     bots << 'googlebot'
    #     bots << 'yahoo'
    #     bots << 'custom stuff'
    #   end
    #
    def setup
      yield(@bots)
    end

    # Public: Returns the array of bots
    #
    def bots
      @bots
    end

    # Public: Convert the array of bots into a regular
    # expression for searching
    def bots_to_regexp
      Regexp.union(bots)
    end

  end
end
