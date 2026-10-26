@varbase-ai-content-review-base @ai @recipes @local @development @staging @production
Feature: Varbase AI Recipe - AI Content Review Base - One editorial review rule for all content
  As a content admin
  I want one review rule with four review agents to cover every content type
  So that every item is reviewed the same way for quality, brand voice, terminology and audience

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Check the editorial review rule covers every content type and is enabled
     When I go to "/admin/config/ai/content-review/rules"
     Then I should see "Editorial review" in the "varbase_editorial_review" row
      And I should see "All" in the "varbase_editorial_review" row
      And I should see "Enabled" in the "varbase_editorial_review" row

  Scenario: Check the four review agents are there
     When I go to "/admin/config/ai/tools-automation/agents"
     Then I should see "Editorial Quality Reviewer"
      And I should see "Brand Voice Compliance"
      And I should see "Prohibited Terminology"
      And I should see "Audience Alignment"
