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
end
