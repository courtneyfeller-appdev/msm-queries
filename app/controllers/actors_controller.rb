class ActorsController < ApplicationController

  def index
    @list_of_actors = Actor.all
    render({ :template => "actor_templates/index.html.erb"})
  end

  def actor_details
    the_ID = params.fetch("actor_id")
    @the_actor = Actor.where({ :id => the_ID }).at(0)
    @characters = Character.where({ :actor_id => the_ID})
    render({ :template => "actor_templates/show.html.erb" })
  end
  
end