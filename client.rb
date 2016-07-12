require 'uri'
require 'json'
require 'net/http'
require 'pry'

class PullIssue

  attr_reader :url
  attr_reader :issue_id

  def initialize(issue_id)
    @issue_id = issue_id
    @url = URI("https://api.github.com/repos/atshelton/API_homework/issues/#{issue_id}")
    @http = Net::HTTP.new(url.host, url.port)
    @http.use_ssl = true
  end

  def fetch_issues
    req = Net::HTTP::Get.new(url)
    req["Authorization"] = "token #{ENV["GITHUB_TOKEN"]}"
    response = @http.request(req)
    body = response.read_body
    payload = JSON.parse(body)
  end
end
