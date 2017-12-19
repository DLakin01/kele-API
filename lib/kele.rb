require 'httparty'
require 'json'

class Kele
  include HTTParty
  include JSON

  def initialize(email, password)
    response = self.class.post("https://www.bloc.io/api/v1/sessions", body: {"email": email, "password": password})
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get("https://www.bloc.io/api/v1/users/me", headers: { "authorization" => @auth_token })
    body = JSON.parse(response.body)
  end

  def get_mentor_availability(id)
    response = self.class.get("https://www.bloc.io/api/v1/mentors/#{id}/student_availability", headers: { "authorization" => @auth_token })
    body = JSON.parse(response.body)
  end

  def get_roadmap(id)
    response = self.class.get("https://www.bloc.io/api/v1/roadmaps/#{id}", headers: { "authorization" => @auth_token })
    body = JSON.parse(response.body)
  end

  def get_checkpoints(id)
    response = self.class.get("https://www.bloc.io/api/v1/checkpoints/#{id}", headers: { "authorization" => @auth_token })
    body = JSON.parse(response.body)
  end

  def get_messages(page = nil)
    if page
      response = self.class.get("https://www.bloc.io/api/v1/message_threads", body: { page: page }, headers: { "authorization" => @auth_token })
      body = JSON.parse(response.body)
    else
      response = self.class.get("https://www.bloc.io/api/v1/message_threads", headers: { "authorization" => @auth_token })
      body = JSON.parse(response.body)
    end
  end

  def create_message(sender, recipient_id, message, subject)
    response = self.class.post("https://www.bloc.io/api/v1/messages", headers: { "authorization" => @auth_token }, body: { sender: sender, recipient_id: recipient_id, stripped_text: message, subject: subject})
    body = JSON.parse(response.body)
  end

  def create_submission(id, checkpoint_id, branch = nil, commit_link = nil, comment = nil)
    response = self.class.post("https://www.bloc.io/api/v1/checkpoint_submissions", body: { enrollment_id: id, checkpoint_id: checkpoint_id, assignment_branch: branch, assignment_commit_link: commit_link, comment: comment }, headers: { "authorization" => @auth_token })
    body = JSON.parse(response.body)
  end
end
