# Exercise 6

class LaunchDiscussionWorkflow

  def initialize(discussion, participantss)
    @discussion = discussion
    @participants = participantss
  end
  
  # Expects @participants array to be filled with User objects
  def run
    return unless valid?
    run_callbacks(:create) do
      ActiveRecord::Base.transaction do
        discussion.save!
        create_discussion_roles!
        @successful = true
      end
    end
  end

  # ...

end

def testDiscussionWorkflow
  discussion = Discussion.new(title: "test", ...)

  workflow = LaunchDiscussionWorkflow.new(discussion, ["fake1@example.com", "fake2@example.com", "fake3@example.com"])
  workflow.generate_participant_users_from_email_string
  workflow.run
end

testDiscussionWorkflow()
