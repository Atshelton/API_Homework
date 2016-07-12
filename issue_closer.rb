class IssueCloser

  attr_reader :issue_id, :url

  def initialize(issue_id)
    @issue_id = issue_id
    @url = URI("https://api.github.com/repos/atshelton/API_homework/issues/#{issue_id}")
    @http = Net::HTTP.new(url.host, url.port)
    @http.use_ssl = true
  end

  def close
    req = Net::HTTP::Patch.new(url)
    req.body = JSON.generate({state: "closed"})
    req["Authorization"] = "token #{ENV["GITHUB_TOKEN"]}"
    response = @http.request(req)
    body = response.read_body
    payload = JSON.parse(body)
  end
end
