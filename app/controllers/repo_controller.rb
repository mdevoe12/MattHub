class RepoController < ApplicationController

  def index
    response = Faraday.get("https://api.github.com/users/mdevoe12/repos?client_id=#{ENV['github_key']}&client_secret=#{ENV['github_secret']}")

    repos = JSON.parse(response.body)

    @repos = Repository.create_repos(repos)
  end

end
