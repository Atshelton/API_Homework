require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './client'
require './issue_closer'

class Issue_Test < Minitest::Test
  def test_issue_can_be_found
    alex_issue = PullIssue.new(1).fetch_issues
    assert_equal "Issue_1", alex_issue["title"]
  end

  def test_issue_can_be_closed
    alex_issue = IssueCloser.new(1).close
    assert_equal "closed", alex_issue["state"]
  end
end
