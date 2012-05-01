Feature: Helper methods should hide content from search bot user agents

  Scenario Outline: See or not block content for agent
    Given my user agent is <user_agent>
    When I am on the test page
    Then I <should> see the block content
    Scenarios:
      | user_agent | should     |
      | googlebot  | should not |
      | mozilla    | should     |
      | msnbot     | should not |
      | android    | should     |
      | yahoo      | should not |

