@varbase-ai-content-review-base @ai @recipes @local @development
Feature: Varbase AI Recipe - AI Content Review Base - Reviewing a blog post
  As a content editor
  I want an AI Review tab on my content with one row per criterion
  So that I can run a review and see a score, a verdict and suggestions before I publish

  Background:
    Given I am a logged in user with the "Content editor" user
     When I go to "/node/add/blog"
      And I fill in "Title" with "A post to review"
      And I fill in "Description" with "A short post written to try the AI review."
      And I fill in the rich text editor field "Content" with "Varbase helps teams build websites faster. It is free and open source."
      And I press "Save"
     Then I should see "A post to review"

  Scenario: Check the AI Review tab lists the four criteria, not run yet
     When I open the top bar page actions menu
      And I click "AI Review"
     Then I should see "Editorial Quality"
      And I should see "Brand Voice Compliance"
      And I should see "Prohibited Terminology"
      And I should see "Audience Alignment"
      And I should see "Not run"

  @no-provider
  Scenario: Verify a review run without an AI provider is recorded as failed
     When I open the top bar page actions menu
      And I click "AI Review"
      And I click "Review" in the "Editorial Quality" row
     Then eventually I should see "Failed" within 40 seconds
      And I should see "by content_editor"

  @ai-provider
  Scenario: Verify a review run gives a score and a grade
     When I open the top bar page actions menu
      And I click "AI Review"
      And I click "Review" in the "Editorial Quality" row
      And I wait max of 40 seconds
     Then I should see "Complete" in the "Editorial Quality" row
      And I should not see "Failed"
