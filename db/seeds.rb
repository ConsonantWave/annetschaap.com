# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Admin.create(:login => "annet",
             :password => "BeatDenmark20",
             :password_confirmation => "BeatDenmark20")

License.create(:name_en => "Initial License",
               :name_nl => "Initial License",
               :downloadable => false,
               :description_en => "Edit this before the site goes live.",
               :description_nl => "Edit this before the site goes live.")