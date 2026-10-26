@varbase-ai-content-review-base @ai @recipes @access @local @development @staging @production
Feature: Varbase AI Recipe - AI Content Review Base - Who runs reviews and who configures them
  As a site owner
  I want editors to run reviews and content and site admins to also manage the rules and the queue
  So that review settings stay with the people responsible for them

  Scenario Outline: Check the "<user>" user can open the AI Review tab
    Given I am a logged in user with the "<user>" user
     When I go to "/node/2/ai-review"
     Then the response status code should be 200
      And I should see "Editorial Quality"

    Examples:
      | user           |
      | Content editor |
      | Content admin  |
      | Site admin     |

  Scenario Outline: Check the "<user>" user can manage the review rules and the queue
    Given I am a logged in user with the "<user>" user
     When I go to "/admin/config/ai/content-review/rules"
     Then I should see "Editorial review"
     When I go to "/admin/config/ai/content-review/queue"
     Then the response status code should be 200

    Examples:
      | user          |
      | Content admin |
      | Site admin    |

  Scenario: Check a content editor runs reviews but cannot change the rules
    Given I am a logged in user with the "Content editor" user
     When I go to "/admin/config/ai/content-review/rules"
     Then the response status code should be 403
      And I should see "Access denied"

  Scenario: Check the SEO admin has no AI Review tab
    Given I am a logged in user with the "SEO admin" user
     When I go to "/node/2/ai-review"
     Then the response status code should be 403
      And I should see "Access denied"

  Scenario: Check an anonymous visitor cannot open the AI Review tab
    Given I am an anonymous user
     When I go to "/node/2/ai-review"
     Then the response status code should be 403
      And I should not see "Editorial Quality"
