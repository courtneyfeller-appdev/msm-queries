class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render({ :template => "director_templates/index.html.erb"})
  end

  def eldest
    @oldest = Director.where.not({ :dob => nil }).order({ :dob => :asc }).at(0)
    render({ :template => "director_templates/eldest.html.erb"})
  end

  def youngest
    @youngest = Director.where.not({ :dob => nil }).order({ :dob => :desc }).at(0)
    render({ :template => "director_templates/youngest.html.erb"})
  end

  def director_details
    the_ID = params.fetch("director_id")
    @the_director = Director.where({ :id => the_ID }).at(0)
    @filmography = Movie.where({ :director_id => the_ID})
    render({ :template => "director_templates/show.html.erb" })
  end

end