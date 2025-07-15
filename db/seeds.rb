# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create categories
categories = [
  { name: "NHL", description: "National Hockey League news and updates", color: "#FF6B35" },
  { name: "Soccer", description: "Soccer/Football news from around the world", color: "#4CAF50" },
  { name: "Football", description: "NFL and college football coverage", color: "#2196F3" },
  { name: "Racing", description: "Auto racing, NASCAR, F1 and more", color: "#FF9800" },
  { name: "Baseball", description: "MLB and baseball news", color: "#9C27B0" },
  { name: "Cricket", description: "International cricket, IPL, and domestic leagues", color: "#00BCD4" }
]

categories.each do |category_attrs|
  Category.find_or_create_by(name: category_attrs[:name]) do |category|
    category.description = category_attrs[:description]
    category.color = category_attrs[:color]
  end
end

puts "Created #{Category.count} categories"

# Create sample users
users = [
  {
    email: "admin@sportsblog.com",
    first_name: "Sports",
    password: "password123"
  },
  {
    email: "sarah.hockey@sportsblog.com", 
    first_name: "Sarah",
    password: "password123"
  },
  {
    email: "mike.football@sportsblog.com",
    first_name: "Mike", 
    password: "password123"
  },
  {
    email: "alex.racing@sportsblog.com",
    first_name: "Alex",
    password: "password123"
  },
  {
    email: "priya.cricket@sportsblog.com",
    first_name: "Priya",
    password: "password123"
  }
]

created_users = []
users.each do |user_attrs|
  user = User.find_or_create_by(email: user_attrs[:email]) do |u|
    u.first_name = user_attrs[:first_name]
    u.password = user_attrs[:password]
    u.password_confirmation = user_attrs[:password]
  end
  created_users << user
end

# Create sample posts with images
sample_posts = [
  {
    title: "Connor McDavid Leads Oilers to Victory Against Flames",
    content: "In a thrilling matchup at Rogers Place, Connor McDavid scored two goals and added an assist to lead the Edmonton Oilers to a 4-2 victory over the Calgary Flames...",
    category: Category.find_by(name: "NHL"),
    user: created_users[0],
    published: true,
    featured: true,
    image_url: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800&h=600&fit=crop"
  },
  {
    title: "Lionel Messi's Impact on Inter Miami Continues to Amaze", 
    content: "Since joining Inter Miami CF, Lionel Messi has transformed not just the team's fortunes but the entire landscape of Major League Soccer...",
    category: Category.find_by(name: "Soccer"),
    user: created_users[0],
    published: true,
    featured: true,
    image_url: "https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=800&h=600&fit=crop"
  },
  {
    title: "Virat Kohli's Century Leads India to Victory in World Cup Final",
    content: "In a nail-biting World Cup final at the Melbourne Cricket Ground, Virat Kohli's masterful century guided India to a thrilling 6-wicket victory over Australia. Kohli's unbeaten 113 off 87 balls was a display of pure class and determination under pressure...",
    category: Category.find_by(name: "Cricket"),
    user: created_users[4],
    published: true,
    featured: true,
    image_url: "https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?w=800&h=600&fit=crop"
  },
  {
    title: "Josh Allen and Bills Dominate Monday Night Football",
    content: "The Buffalo Bills put on a clinic Monday night, defeating the New York Jets 31-10 in a game that was never really in doubt...",
    category: Category.find_by(name: "Football"),
    user: created_users[2],
    published: true,
    image_url: "https://images.unsplash.com/photo-1566577739112-5180d4bf9390?w=800&h=600&fit=crop"
  },
  {
    title: "Max Verstappen Clinches Third Consecutive Formula 1 Championship",
    content: "Max Verstappen has done it again. The Dutch driver secured his third consecutive Formula 1 World Championship...",
    category: Category.find_by(name: "Racing"),
    user: created_users[3],
    published: true,
    image_url: "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800&h=600&fit=crop"
  },
  {
    title: "Shohei Ohtani Makes History with 50-50 Season",
    content: "In what can only be described as one of the greatest individual seasons in baseball history, Shohei Ohtani has become the first player ever to hit 50 home runs and steal 50 bases...",
    category: Category.find_by(name: "Baseball"),
    user: created_users[0],
    published: true,
    image_url: "https://images.unsplash.com/photo-1566577739112-5180d4bf9390?w=800&h=600&fit=crop"
  },
  {
    title: "IPL 2024: Mumbai Indians' Stunning Comeback Victory",
    content: "In one of the most thrilling IPL matches of the season, Mumbai Indians pulled off a stunning comeback victory against Chennai Super Kings at Wankhede Stadium. Chasing a mammoth 201, MI looked down and out at 89/6 before Hardik Pandya's explosive 71* off 30 balls turned the game on its head...",
    category: Category.find_by(name: "Cricket"),
    user: created_users[4],
    published: true,
    image_url: "https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?w=800&h=600&fit=crop"
  },
  {
    title: "England vs Australia: The Ashes Series Reaches Fever Pitch",
    content: "The 2024 Ashes series has lived up to all expectations as England and Australia battle it out in what many are calling one of the greatest Test series in recent memory. With the series tied 2-2 heading into the final Test at The Oval, both teams are leaving nothing to chance...",
    category: Category.find_by(name: "Cricket"),
    user: created_users[4],
    published: true,
    image_url: "https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?w=800&h=600&fit=crop"
  },
  {
    title: "Women's Cricket World Cup: Australia Dominates Group Stage",
    content: "The Australian women's cricket team has been in dominant form during the group stage of the Cricket World Cup, winning all their matches convincingly. Led by captain Meg Lanning and star all-rounder Ellyse Perry, the defending champions look unstoppable...",
    category: Category.find_by(name: "Cricket"),
    user: created_users[0],
    published: true,
    image_url: "https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?w=800&h=600&fit=crop"
  },
  {
    title: "T20 World Cup: Pakistan's Babar Azam Breaks Records",
    content: "Pakistan captain Babar Azam has been in scintillating form during the T20 World Cup, breaking multiple records and leading his team's charge towards the semifinals. His elegant stroke play and consistent performances have made him the tournament's leading run-scorer...",
    category: Category.find_by(name: "Cricket"),
    user: created_users[4],
    published: true,
    image_url: "https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?w=800&h=600&fit=crop"
  },
  {
    title: "Stanley Cup Playoffs Heat Up as Underdogs Make Their Mark",
    content: "The NHL playoffs are in full swing, and this year's tournament has been full of surprises. Several underdog teams have made deep runs, challenging the traditional powerhouses and creating some of the most exciting hockey we've seen in years.\n\nThe Florida Panthers, who barely squeezed into the playoffs as a wild card team, have knocked out two division winners and are now in the conference finals. Their goaltender Sergei Bobrovsky has been playing lights-out hockey, posting a .935 save percentage through three rounds.\n\nMeanwhile, the Seattle Kraken are making their first-ever playoff appearance count, upsetting the defending champion Colorado Avalanche in the first round. The young franchise has captured the hearts of hockey fans everywhere with their gritty, never-say-die attitude.\n\n'This is what makes the Stanley Cup playoffs so special,' said NHL analyst Pierre McGuire. 'Any team can get hot at the right time and make a run. That's the beauty of playoff hockey.'\n\nWith several Game 7s on the horizon, fans are in for some incredible hockey in the coming weeks.",
    category: Category.find_by(name: "NHL"),
    user: created_users[1],
    published: true,
    image_url: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800&h=600&fit=crop"
  },
  {
    title: "World Cup Qualifiers: Upsets and Surprises Around the Globe",
    content: "The road to the next FIFA World Cup is heating up, with qualifying matches taking place across all confederations. Several traditional powerhouses are struggling, while some unexpected nations are making strong cases for their first World Cup appearances.\n\nIn South America, Argentina continues to dominate under Lionel Messi's leadership, but Brazil has surprisingly dropped points in recent matches. Colombia and Uruguay are battling for the remaining automatic qualification spots, with both teams showing impressive form.\n\nEurope has seen its share of surprises as well. Georgia has emerged as a dark horse in their qualifying group, currently sitting in second place behind Spain. Their attacking style of play and passionate home support have made them a difficult opponent for any team.\n\nIn Africa, Morocco's success at the last World Cup has inspired a new generation of players across the continent. Several African nations are showing improved tactical discipline and technical ability, promising an exciting tournament ahead.\n\n'The level of football around the world continues to rise,' said former World Cup winner Roberto Carlos. 'We're seeing more competitive matches and fewer easy games, which is great for the sport.'",
    category: Category.find_by(name: "Soccer"),
    user: created_users[2],
    published: true,
    image_url: "https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=800&h=600&fit=crop"
  },
  {
    title: "NFL Draft Prospects: Who Will Be This Year's Steal?",
    content: "As the NFL Draft approaches, scouts and analysts are buzzing about this year's deep class of talent. While the top picks seem relatively set, there's significant debate about which players might be steals in the later rounds.\n\nQuarterback remains the most scrutinized position, with three signal-callers expected to go in the first round. However, several Day 2 and Day 3 prospects have shown flashes of brilliance that could translate to NFL success with the right development.\n\nThe wide receiver class is particularly deep this year, with analysts comparing it to the legendary 2014 draft that produced Odell Beckham Jr., Mike Evans, and Jarvis Landry. Teams looking for offensive weapons should find plenty of options throughout the draft.\n\nDefensively, pass rushers are at a premium as always, but this year's linebacker class has exceptional depth. Several players who might have been first-round picks in previous years could fall to the second round due to the overall strength of the position.\n\n'This is one of the most balanced drafts I've seen in years,' said ESPN draft analyst Mel Kiper Jr. 'Teams that do their homework and trust their evaluations could find impact players well into Day 3.'",
    category: Category.find_by(name: "Football"),
    user: created_users[2],
    published: true,
    image_url: "https://images.unsplash.com/photo-1566577739112-5180d4bf9390?w=800&h=600&fit=crop"
  },
  {
    title: "Formula 1 Technical Regulations: How Teams Are Adapting",
    content: "The current Formula 1 technical regulations have created some of the closest racing we've seen in years, but teams continue to find innovative ways to gain competitive advantages within the rules. The battle for aerodynamic efficiency has moved to new areas of the car.\n\nRed Bull Racing's continued dominance has forced other teams to completely rethink their approach to car design. Mercedes has made significant strides with their latest upgrades, while Ferrari continues to struggle with consistency despite having raw pace.\n\nThe cost cap has also changed how teams operate, forcing them to be more strategic about their development programs. Smaller teams like Aston Martin and Alpine have been able to close the gap somewhat, creating more competitive midfield battles.\n\n'The regulations have achieved what they set out to do,' said former F1 driver Martin Brundle. 'We're seeing more wheel-to-wheel racing and less predictable outcomes, which is exactly what the sport needed.'\n\nLooking ahead to next season, several teams are already working on radical design concepts that could shake up the competitive order once again.",
    category: Category.find_by(name: "Racing"),
    user: created_users[3],
    published: true,
    image_url: "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800&h=600&fit=crop"
  },
  {
    title: "MLB Trade Deadline Approaching: Who's Buying and Selling?",
    content: "With the MLB trade deadline just weeks away, front offices across the league are making crucial decisions about whether to buy or sell. Several surprise contenders have emerged, while some expected playoff teams are struggling.\n\nThe Tampa Bay Rays continue to defy expectations, sitting atop the AL East despite having one of the lowest payrolls in baseball. Their player development system and analytical approach have once again produced a competitive team that could be buyers at the deadline.\n\nMeanwhile, the New York Mets' disappointing season has them considering trading some veteran players. Their struggles have been particularly surprising given their significant offseason investments.\n\nStarting pitching remains the most coveted commodity, with several aces potentially available. Teams like the Chicago White Sox and Oakland Athletics are expected to move their veteran starters to contending clubs.\n\n'The trade deadline is always exciting, but this year feels particularly unpredictable,' said MLB Network analyst Jon Heyman. 'There are more buyers than usual, which should drive up prices and create some interesting deals.'\n\nExpect plenty of movement in the coming weeks as teams make their final pushes for October.",
    category: Category.find_by(name: "Baseball"),
    user: created_users[1],
    published: true,
    image_url: "https://images.unsplash.com/photo-1566577739112-5180d4bf9390?w=800&h=600&fit=crop"
  },
  {
    title: "Women's Hockey World Championship: Canada vs USA Rivalry Renewed",
    content: "The Women's Hockey World Championship is set to showcase the sport's brightest stars, with the eternal rivalry between Canada and the United States taking center stage once again. Both teams have been dominant in recent years, setting up what promises to be an epic tournament.\n\nCanada enters as the defending champions, led by captain Marie-Philip Poulin, who has been nothing short of spectacular in international competition. The Canadian team's depth and experience give them a slight edge on paper, but hockey games aren't played on paper.\n\nThe United States boasts an incredibly talented young core, with players like Hilary Knight and Kendall Coyne Schofield leading the charge. Their speed and skill have been on full display in recent exhibitions, and they're hungry to reclaim the world championship.\n\nOther nations are also making their presence felt. Finland has developed into a legitimate medal contender, while Switzerland and Sweden continue to improve their programs year after year.\n\n'The level of women's hockey continues to rise globally,' said Hockey Canada executive director Scott Salmond. 'This tournament will showcase just how competitive and entertaining our sport has become.'\n\nFans can expect fast-paced, highly skilled hockey throughout the tournament.",
    category: Category.find_by(name: "NHL"),
    user: created_users[1],
    published: true,
    image_url: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800&h=600&fit=crop"
  },
  {
    title: "Premier League Title Race: Manchester City's Dominance Continues",
    content: "Manchester City's relentless pursuit of excellence has put them in pole position for another Premier League title, but several challengers refuse to give up the fight. With just a few matches remaining, every point matters in what has become a thrilling title race.\n\nPep Guardiola's side has shown their championship pedigree in recent weeks, grinding out results even when not at their best. Erling Haaland's goal-scoring prowess has been crucial, with the Norwegian striker adapting brilliantly to English football.\n\nArsenal, led by the impressive Mikel Arteta, has pushed City every step of the way. Their young squad has shown remarkable maturity and resilience, suggesting bright things ahead regardless of this season's outcome.\n\nLiverpool and Manchester United have also remained in contention, with both teams capable of taking points from anyone on their day. The depth of quality in the Premier League has made for compelling viewing throughout the season.\n\n'This is why the Premier League is considered the best league in the world,' said former England captain Alan Shearer. 'The competition is fierce from top to bottom, and you can never predict what will happen next.'\n\nThe final weeks promise to be unmissable for football fans worldwide.",
    category: Category.find_by(name: "Soccer"),
    user: created_users[0],
    published: true,
    image_url: "https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=800&h=600&fit=crop"
  },
  {
    title: "College Football Playoff Expansion: What It Means for the Sport",
    content: "The announcement of College Football Playoff expansion has sent shockwaves through the sport, with coaches, players, and fans debating the implications of the new format. The move from four to twelve teams represents the most significant change to college football's postseason in decades.\n\nProponents argue that expansion will give more teams a legitimate shot at the national championship, reducing the controversy that has surrounded the selection committee's decisions in recent years. Smaller conferences and Group of Five schools are particularly excited about increased opportunities.\n\nCritics worry that expansion could diminish the importance of the regular season and traditional bowl games. They argue that the current four-team format creates the perfect balance between inclusivity and maintaining the sport's unique regular season intensity.\n\nThe financial implications are enormous, with television networks and conferences set to benefit from additional playoff games. However, questions remain about how revenue will be distributed and what this means for competitive balance.\n\n'This is a historic moment for college football,' said ESPN analyst Kirk Herbstreit. 'Change is never easy, but I believe this expansion will ultimately be good for the sport and its fans.'\n\nThe new format is expected to begin in the 2026 season, giving everyone time to adjust to the new reality.",
    category: Category.find_by(name: "Football"),
    user: created_users[2],
    published: true,
    image_url: "https://images.unsplash.com/photo-1566577739112-5180d4bf9390?w=800&h=600&fit=crop"
  },
  {
    title: "IndyCar Season Reaches Climax: Championship Battle Intensifies",
    content: "The IndyCar season is reaching its thrilling conclusion, with multiple drivers still in contention for the championship. The combination of oval racing, road courses, and street circuits has created one of the most competitive seasons in recent memory.\n\nScott Dixon, the veteran New Zealander, continues to show why he's considered one of the greatest IndyCar drivers of all time. His consistency and racecraft have kept him in championship contention despite not winning as many races as some of his younger competitors.\n\nPato O'Ward has emerged as a legitimate title threat, with his aggressive driving style and fearless approach earning him multiple victories this season. The young Mexican driver represents the new generation of IndyCar talent that's pushing the sport to new heights.\n\nThe Indianapolis 500 winner has also remained in the hunt, using that momentum to string together several strong finishes. The unpredictable nature of IndyCar racing means that any of the top contenders could still claim the championship.\n\n'This is what IndyCar racing is all about,' said series veteran Tony Kanaan. 'Close competition, multiple winners, and a championship fight that goes down to the wire. It doesn't get much better than this.'\n\nFans are in for an exciting finish to what has been an outstanding season.",
    category: Category.find_by(name: "Racing"),
    user: created_users[3],
    published: true,
    image_url: "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800&h=600&fit=crop"
  },
  {
    title: "World Series Predictions: Dark Horses and Championship Favorites",
    content: "As the MLB season enters its final stretch, several teams have emerged as legitimate World Series contenders. While some traditional powerhouses are in the mix, a few surprise teams have positioned themselves for potential October runs.\n\nThe Atlanta Braves have quietly assembled one of the most complete rosters in baseball, with strong pitching, timely hitting, and solid defense. Their experience from recent playoff runs gives them an edge in high-pressure situations.\n\nThe Los Angeles Dodgers remain the betting favorites, with their combination of star power and organizational depth. However, their recent playoff struggles have raised questions about their ability to get over the hump.\n\nDark horse candidates include the Baltimore Orioles, whose young core has exceeded all expectations, and the Texas Rangers, who have finally put together a complete team after years of rebuilding.\n\nPitching will be crucial in October, as it always is. Teams with deep rotations and reliable bullpens will have significant advantages in the grueling playoff format.\n\n'October baseball is unlike anything else in sports,' said Hall of Famer John Smoltz. 'Regular season success doesn't guarantee playoff success. It's all about getting hot at the right time and having your best players perform when it matters most.'\n\nThe race for playoff positioning promises to be intense over the final weeks.",
    category: Category.find_by(name: "Baseball"),
    user: created_users[0],
    published: true,
    image_url: "https://images.unsplash.com/photo-1566577739112-5180d4bf9390?w=800&h=600&fit=crop"
  }
]

require 'open-uri'

sample_posts.each do |post_attrs|
  post = Post.find_or_create_by(title: post_attrs[:title]) do |p|
    p.content = post_attrs[:content]
    p.category = post_attrs[:category]
    p.user = post_attrs[:user]
    p.published = post_attrs[:published]
    p.featured = post_attrs[:featured] || false
  end
  
  # Attach image if post was created and doesn't already have one
  if post.persisted? && !post.photo.attached? && post_attrs[:image_url]
    begin
      image_file = URI.open(post_attrs[:image_url])
      post.photo.attach(
        io: image_file,
        filename: "#{post.title.parameterize}.jpg",
        content_type: 'image/jpeg'
      )
    rescue => e
      puts "Failed to attach image for post '#{post.title}': #{e.message}"
    end
  end
end

# Create sample likes for posts
puts "Creating sample likes..."
Post.published.each do |post|
  # Random number of likes between 5-25
  like_count = rand(5..25)
  
  like_count.times do |i|
    # Mix of user likes and anonymous likes
    if i < like_count * 0.7 && created_users.any?
      # User like
      user = created_users.sample
      Like.find_or_create_by(post: post, user: user)
    else
      # Anonymous like
      session_id = "session_#{post.id}_#{i}"
      Like.find_or_create_by(post: post, session_id: session_id, user: nil)
    end
  end
end

# Duplicate all posts with slight variations
puts "Creating duplicate posts with variations..."
existing_posts = Post.all.to_a

existing_posts.each do |original_post|
  # Create variations of existing posts
  variations = [
    { suffix: " - Updated Analysis", content_prefix: "In a follow-up analysis, " },
    { suffix: " - Breaking News", content_prefix: "Breaking: " },
    { suffix: " - Expert Opinion", content_prefix: "Sports analysts believe that " },
    { suffix: " - Fan Reactions", content_prefix: "Fans are buzzing about " }
  ]
  
  variation = variations.sample
  
  new_post = Post.create!(
    title: original_post.title + variation[:suffix],
    content: variation[:content_prefix] + original_post.content,
    category: original_post.category,
    user: created_users.sample,
    published: true,
    featured: [true, false, false, false].sample # 25% chance of being featured
  )
  
  # Attach same image if original had one
  if original_post.photo.attached?
    begin
      original_post.photo.blob.open do |file|
        new_post.photo.attach(
          io: file,
          filename: "#{new_post.title.parameterize}.jpg",
          content_type: 'image/jpeg'
        )
      end
    rescue => e
      puts "Failed to duplicate image for post '#{new_post.title}': #{e.message}"
    end
  end
  
  # Add random likes to new posts
  like_count = rand(3..20)
  like_count.times do |i|
    if i < like_count * 0.6 && created_users.any?
      user = created_users.sample
      Like.find_or_create_by(post: new_post, user: user)
    else
      session_id = "session_#{new_post.id}_#{i}"
      Like.find_or_create_by(post: new_post, session_id: session_id, user: nil)
    end
  end
end

puts "Created #{User.count} users"
puts "Created #{Post.count} posts"
puts "Created #{Like.count} likes"
