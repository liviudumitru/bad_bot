module BadBot
  # Detector
  # Gives the controller the ability to detect and behave
  # different for requests that come from search bots.
  #
  # Example:
  #   class ApplicationController < ...
  #     include BadBot::Detector
  #   end
  #   ...
  #   <div>
  #     <% no_bot do %>
  #       stuff that is not worth to crawl
  #     <% end %>
  #   </div>
  #
  #
  module Detector
    extend ActiveSupport::Concern

    included do
      before_filter :detect_search_bots
      helper_method :no_bot, :is_bot?
    end

    # Public: Helper that only executes the block in case 
    # this is not a request made by a search bot
    #
    def no_bot(&block)
      block.call unless(is_bot?)
    end

    # Public: Helper that returns true or false, if the the
    # request if from a search bot or not.
    #
    def is_bot?
      @search_bot
    end

    private

    # Private: Detects if the request comes from a search bot or not
    #
    def detect_search_bots
      @search_bot ||= (request.user_agent =~ BadBot::Bots.instance.bots_to_regexp ? true : false)
    end
  end
end
