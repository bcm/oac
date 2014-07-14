# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

trips = [
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/backpacking/May-Lake-3day.html',
      starts_on: Date.parse('July 18, 2014'),
      ends_on: Date.parse('July 20, 2014')
    },
    attrs: {
      name: 'Backpacking and Camping Weekend at May Lake at Tuolumne Meadows in Yosemite National Park',
      shortname: 'May Lake',
      category: 1
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/hiking/redwoods-waterfalls-hike-big-basin.html',
      starts_on: Date.parse('Jul 19, 2014'),
      ends_on: Date.parse('Jul 19, 2014')
    },
    attrs: {
      name: 'Redwoods and Waterfalls Hike in Big Basin',
      shortname: 'Big Basin',
      category: 0
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/rock-climbing/beyond-basics-climbing-castle-rock.html',
      starts_on: Date.parse('Jul 20, 2014'),
      ends_on: Date.parse('Jul 20, 2014')
    },
    attrs: {
      name: 'Rock Climbing Beyond Basics at Castle Rock State Park',
      shortname: 'Castle Rock',
      category: 2
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/hiking/Woodward-Valley-Pt-Reyes.html',
      starts_on: Date.parse('July 26'),
      ends_on: Date.parse('July 26')
    },
    attrs: {
      name: 'Hike the Woodward Valley Loop in Point Reyes',
      shortname: 'Woodward Valley',
      category: 0
    }
  },
  {
    key: {
      name: 'Beginner Rock Climbing at Castle Rock State Park',
      url: 'http://www.outdooradventureclub.com/trips/rock-climbing/beginner-climbing-castle-rock.html',
      starts_on: Date.parse('July 27')
    },
    attrs: {
      ends_on: Date.parse('July 27'),
      shortname: 'Castle Rock',
      category: 2
    }
  }
]

trips.each do |spec|
  Trip.find_or_create_by!(spec[:key]) do |trip|
    trip.assign_attributes(attrs)
  end
end
