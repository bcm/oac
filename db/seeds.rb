# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

trips = [
  {
    name: 'Backpacking and Camping Weekend at May Lake at Tuolumne Meadows in Yosemite National Park',
    url: 'http://www.outdooradventureclub.com/trips/backpacking/May-Lake-3day.html',
    starts_on: Date.parse('July 18, 2014'),
    ends_on: Date.parse('July 20, 2014'),
    shortname: 'May Lake'
  },
  {
    name: 'Redwoods and Waterfalls Hike in Big Basin',
    url: 'http://www.outdooradventureclub.com/trips/hiking/redwoods-waterfalls-hike-big-basin.html',
    starts_on: Date.parse('Jul 19, 2014'),
    ends_on: Date.parse('Jul 19, 2014'),
    shortname: 'Big Basin'
  },
  {
    name: 'Rock Climbing Beyond Basics at Castle Rock State Park',
    url: 'http://www.outdooradventureclub.com/trips/rock-climbing/beyond-basics-climbing-castle-rock.html',
    starts_on: Date.parse('Jul 20, 2014'),
    ends_on: Date.parse('Jul 20, 2014'),
    shortname: 'Castle Rock'
  },
  {
    name: 'Hike the Woodward Valley Loop in Point Reyes',
    url: 'http://www.outdooradventureclub.com/trips/hiking/Woodward-Valley-Pt-Reyes.html',
    starts_on: Date.parse('July 26'),
    ends_on: Date.parse('July 26'),
    shortname: 'Woodward Valley'
  },
  {
    name: 'Beginner Rock Climbing at Castle Rock State Park',
    url: 'http://www.outdooradventureclub.com/trips/rock-climbing/beginner-climbing-castle-rock.html',
    starts_on: Date.parse('July 27'),
    ends_on: Date.parse('July 27'),
    shortname: 'Castle Rock'
  },
]

trips.each do |attrs|
  Trip.find_or_create_by!(attrs)
end
