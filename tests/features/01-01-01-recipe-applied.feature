@varbase-ai @content-review @recipe
Feature: The Varbase AI Content Review Base recipe sets up AI content review
  As a Varbase site builder
  I want the recipe to add the review agents, the review rule and the permissions
  So that editors can review any content item against the site's style guide

  Scenario: The editorial review rule exists
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/admin/config/ai/content-review/rules"
    Then I should see "Editorial review"
     And I the page should not have PHP errors

  Scenario: The four review agents exist
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/admin/config/ai/tools-automation/agents"
    Then I should see "Editorial Quality Reviewer"
     And I should see "Brand Voice Compliance"
     And I should see "Prohibited Terminology"
     And I should see "Audience Alignment"
     And I the page should not have PHP errors

  Scenario: The review queue and records pages load
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/admin/config/ai/content-review/queue"
    Then I the page should not have PHP errors
    When I navigate to "/admin/config/ai/content-review/records"
    Then I the page should not have PHP errors

  Scenario: A content editor cannot change the review rules
    Given I am a logged in user with the "Content editor" user
    When I navigate to "/admin/config/ai/content-review/rules"
    Then I should not see "Editorial review"
     And I the page should not have PHP errors
