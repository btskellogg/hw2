# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

## Clear Data
Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Role.destroy_all
## Clear Data


#Studio Entry
studio = Studio.new
studio["name"] = "Warner Bros"
studio.save



#Movie Entries
warner = Studio.find_by({"name" => "Warner Bros"})
movie = Movie.new
movie["title"] = "Batman Begins"
movie["year released"] = 2005
movie["rated"] = "PG-13"
movie["studio_id"] = warner["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year released"] = 2008
movie["rated"] = "PG-13"
movie["studio_id"] = warner["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year released"] = 2012
movie["rated"] = "PG-13"
movie["studio_id"] = warner["id"]
movie.save

#Actor Entries
actor = Actor.new
actor["name"] = "Christian Bale"
actor.save

actor = Actor.new
actor["name"] = "Michael Caine"
actor.save

actor = Actor.new
actor["name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor["name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor["name"] = "Gary Oldman"
actor.save

actor = Actor.new
actor["name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor["name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor.save

actor = Actor.new
actor["name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor["name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor["name"] = "Anne Hathaway"
actor.save

#Role Entries
begins = Movie.find_by({"title" => "Batman Begins"})
bale = Actor.find_by({"name" => "Christian Bale"})
role = Role.new
role["movie_id"] = begins["id"]
role["actor_id"] = bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

caine = Actor.find_by({"name" => "Michael Caine"})
role = Role.new
role["movie_id"] = begins["id"]
role["actor_id"] = caine["id"]
role["character_name"] = "Alfred"
role.save

neeson = Actor.find_by({"name" => "Liam Neeson"})
role = Role.new
role["movie_id"] = begins["id"]
role["actor_id"] = neeson["id"]
role["character_name"] = "Ra's Al Ghul"
role.save

holmes = Actor.find_by({"name" => "Katie Holmes"})
role = Role.new
role["movie_id"] = begins["id"]
role["actor_id"] = holmes["id"]
role["character_name"] = "Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = begins["id"]
role["actor_id"] = 5
role["character_name"] = "Commissioner Gordon"
role.save

dark1 = Movie.find_by({"title" => "The Dark Knight"})
oldman = Actor.find_by({"name" => "Gary Oldman"})
role = Role.new
role["movie_id"] = dark1["id"]
role["actor_id"] = oldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save

ledger = Actor.find_by({"name" => "Heath Ledger"})
role = Role.new
role["movie_id"] = dark1["id"]
role["actor_id"] = ledger["id"]
role["character_name"] = "Joker"
role.save

eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
role = Role.new
role["movie_id"] = dark1["id"]
role["actor_id"] = eckhart["id"]
role["character_name"] = "Harvey Dent"
role.save

role = Role.new
role["movie_id"] = dark1["id"]
role["actor_id"] = caine["id"]
role["character_name"] = "Alfred"
role.save

gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})
role = Role.new
role["movie_id"] = dark1["id"]
role["actor_id"] = gyllenhaal["id"]
role["character_name"] = "Rachel Dawes"
role.save

dark2 = Movie.find_by({"title" => "The Dark Knight Rises"})
role = Role.new
role["movie_id"] = dark2["id"]
role["actor_id"] = bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = dark2["id"]
role["actor_id"] = oldman["id"]
role["character_name"] = "Commissioner Gordon"

hardy = Actor.find_by(name: "Tom Hardy")
role = Role.new
role["movie_id"] = dark2
role["actor_id"] = hardy
role["character_name"] = "Bane"
role.save

gordon_levitt = Actor.find_by(name: "Joseph Gordon-Levitt")
role = Role.new
role["movie_id"] = dark2
role["actor_id"] = gordon_levitt
role["character_name"] = "John Blake"
role.save

hathaway = Actor.find_by(name: "Anne Hathaway")
role["movie_id"] = dark2
role["actor_id"] = hathaway
role["character_name"] = "Selina Kyle"
role.save

##

puts "Movies"
puts "======"
puts ""

# Define the column widths
title_width = 24
year_width = 10
rating_width = 10
studio_id_width = 10

# Display column headers
printf("%-#{title_width}s%-#{year_width}s%-#{rating_width}s%-#{studio_id_width}s\n", "Title", "Year", "Rating", "Studio ID")
puts "-" * (title_width + year_width + rating_width + studio_id_width)

allmovies = Movie.all

for movie in allmovies
    # store variables
    title = movie["title"];
    year = movie["year released"];
    rating = movie["rated"];
    studio = Studio.find_by("id" => movie.studio_id)
    studio_id = if studio.present? then studio.name else " " end



    # display string
    printf("%-#{title_width}s%-#{year_width}s%-#{rating_width}s%-#{studio_id_width}s\n", title, year, rating, studio_id)
  end


# Define the column widths
movie_width = 25
actor_width = 25
role_width = 25

# Display column headers
printf("%-#{movie_width}s%-#{actor_width}s%-#{role_width}s\n", "Movie", "Actor", "Role")
puts "-" * (movie_width + actor_width + role_width)

  allroles = Role.all

  for role in allroles
    # store variables
    movie = Movie.find_by("id" => role.movie_id)
    movie_name = if movie.present? then movie.title else " " end #included due to persistant database errors
    actor = Actor.find_by("id" => role.actor_id)
    actor_name = if actor.present? then actor.name else " " end #included due to persistant database errors
    role_name = role["character_name"]
      
    # display string
    printf("%-#{movie_width}s%-#{actor_width}s%-#{role_width}s\n", movie_name, actor_name, role_name)
  end