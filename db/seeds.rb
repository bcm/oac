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
      url: 'http://www.outdooradventureclub.com/trips/rock-climbing/beginner-climbing-castle-rock.html',
      starts_on: Date.parse('July 27'),
      ends_on: Date.parse('July 27')
    },
    attrs: {
      name: 'Beginner Rock Climbing at Castle Rock State Park',
      shortname: 'Castle Rock',
      category: 2
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/backpacking/Twin-Lakes-Sequoia.html',
      starts_on: Date.parse('August 1'),
      ends_on: Date.parse('August 3')
    },
    attrs: {
      name: 'Backpack to Twin Lakes in Sequoia National Park',
      shortname: 'Twin Lakes',
      category: 1
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/hiking/waddell-creek-berry-falls.html',
      starts_on: Date.parse('August 3'),
      ends_on: Date.parse('August 3')
    },
    attrs: {
      name: 'Hike Rancho Del Oso to Berry Creek Falls in Big Basin Redwoods State Park',
      shortname: 'Berry Creek Falls',
      category: 0
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/rock-climbing/Free-Climbing-Intro-Lombardi.html',
      starts_on: Date.parse('August 7'),
      ends_on: Date.parse('August 7')
    },
    attrs: {
      name: 'Climb the Wall at Lombardi Sports - FREE Introduction to Rock Climbing',
      shortname: 'Lombardi Climbing',
      category: 2
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/backpacking/lost-coast-summer-backpacking.html',
      starts_on: Date.parse('August 9'),
      ends_on: Date.parse('August 11')
    },
    attrs: {
      name: 'Backpack the Lost Coast Trail',
      shortname: 'Lost Coast',
      category: 1
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/rock-climbing/beyond-basics-climbing-castle-rock.html',
      starts_on: Date.parse('August 9'),
      ends_on: Date.parse('August 9')
    },
    attrs: {
      name: 'Rock Climbing Beyond Basics at Castle Rock State Park',
      shortname: 'Castle Rock',
      category: 2
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/kayaking/Sea-Caves-Santa-Cruz-kayak.html',
      starts_on: Date.parse('August 9'),
      ends_on: Date.parse('August 9')
    },
    attrs: {
      name: 'Kayaking through Sea Caves and Kayak Sailing in Santa Cruz',
      shortname: 'Sea Caves Santa Cruz',
      category: 3
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/hiking/bass-lake-point-reyes-hike.html',
      starts_on: Date.parse('August 10'),
      ends_on: Date.parse('August 10')
    },
    attrs: {
      name: 'Hike and Swim at Bass Lake in Pt. Reyes National Seashore',
      shortname: 'Bass Lake Pt. Reyes',
      category: 1
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/rock-climbing/cragmont-gear-anchor-class.html',
      starts_on: Date.parse('August 10'),
      ends_on: Date.parse('August 10')
    },
    attrs: {
      name: "Rock Climber's Gear and Anchor Class at Cragmont in Berkeley",
      shortname: 'Cragmont Gear & Anchor',
      category: 2
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/backpacking/Half-Dome-Backpacking.html',
      starts_on: Date.parse('August 16'),
      ends_on: Date.parse('August 17')
    },
    attrs: {
      name: 'Backpack to Little Yosemite Valley with Half Dome Summit',
      shortname: 'Half Dome Backpacking',
      category: 1
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/hiking/mt-tam-lakes-loop.html',
      starts_on: Date.parse('August 16'),
      ends_on: Date.parse('August 16')
    },
    attrs: {
      name: 'Hike the Lakes Loop on Mt Tamalpais in Marin',
      shortname: 'Mt Tam Lakes Loop',
      category: 0
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/backpacking/Rae-Lakes-Loop-Kings-Canyon.html',
      starts_on: Date.parse('August 22'),
      ends_on: Date.parse('August 24')
    },
    attrs: {
      name: 'Backpack Rae Lakes Loop (Fast and Light) in Kings Canyon National Park',
      shortname: 'Rake Lakes Loop Kings Canyon',
      category: 1
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/rock-climbing/Beginner-Climbing-Berkeley-Hills.html',
      starts_on: Date.parse('August 23'),
      ends_on: Date.parse('August 23')
    },
    attrs: {
      name: 'Learn to Rock Climb in the Berkeley Hills',
      shortname: 'Beginner Climbing Berkeley Hills',
      category: 2
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/hiking/castle-rock-saratoga-gap-hike.html',
      starts_on: Date.parse('August 24'),
      ends_on: Date.parse('August 24')
    },
    attrs: {
      name: 'Hike Saratoga Gap to Castle Rock State Park in the Peninsula',
      shortname: 'Saratoga Gap',
      category: 0
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/hiking-camping/Sequoia-DorstCreek-LaborDay.html',
      starts_on: Date.parse('August 29'),
      ends_on: Date.parse('September 1')
    },
    attrs: {
      name: 'Hike and Camp in Sequoia National Park Labor Day Weekend',
      shortname: 'Sequoia Dorst Creek',
      category: 4
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/backpacking/ten-lakes-yosemite-laborday.html',
      starts_on: Date.parse('August 30'),
      ends_on: Date.parse('September 1')
    },
    attrs: {
      name: 'Labor Day Weekend Backpacking Ten Lakes in Yosemite National Park',
      shortname: 'Ten Lakes',
      category: 1
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/rafting/Raft-MF-American-labor.html',
      starts_on: Date.parse('August 30'),
      ends_on: Date.parse('August 31'),
    },
    attrs: {
      name: 'Labor Day Weekend Whitewater Rafting and Camping on the Middle Fork of the American River (Class 3-4)',
      shortname: 'Raft MF American',
      category: 5
    }
  },
  {
    key: {
      url: 'http://www.outdooradventureclub.com/trips/hiking/Purisima-Creek.html',
      starts_on: Date.parse('August 31'),
      ends_on: Date.parse('August 31')
    },
    attrs: {
      name: 'Hike in Purisima Creek Redwoods Preserve',
      shortname: 'Purisima Creek',
      category: 0
    }
  }
]

trips.each do |spec|
  Trip.find_or_initialize_by(spec[:key]) do |trip|
    trip.assign_attributes(spec[:attrs])
    trip.uuid ||= SecureRandom.uuid
  end.save!
end
