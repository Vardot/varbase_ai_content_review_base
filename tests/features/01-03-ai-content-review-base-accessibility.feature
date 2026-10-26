@varbase-ai-content-review-base @ai @recipes @a11y @local @development @staging @production
Feature: Varbase AI Recipe - AI Content Review Base - Accessible AI Review
  As a content editor who uses assistive technology
  I want the AI Review tab to work with a keyboard and a screen reader
  So that I can review my content with AI like anyone else

  Scenario: Check the AI Review tab gives every field a label and every link a name
    Given I am a logged in user with the "Content editor" user
     When I go to "/node/2/ai-review"
     Then every form field should have an accessible label
      And every link should have an accessible name
      And every ARIA role should be valid
