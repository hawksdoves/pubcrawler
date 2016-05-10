# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




  challenges = [[
    name: "Glasses of Wine",
    details: "Each person must order alternating colours of wine.",
    time_allocation: 30
  ],[
    name: "Greet a stranger",
    details: "The person that manages to remain shaking a stangers hand for the longest, gets to make a rule.",
    time_allocation: 30
  ],[
    name: "Pint of Black",
    details: "Everybody orders a Guiness or Stout",
    time_allocation: 30
  ],[
    name: "Three sips",
    details: "Your next drink must be drunk in three sips",
    time_allocation: 30
  ],[
    name: "Find a friend",
    details: "Take a group photo with somebody who's name begins with the letter 'N'",
    time_allocation: 30
  ],[
    name: "Group Photo",
    details: "Take a group picture with your drinks empty and post it with the hashtag '#pubcrawler'",
    time_allocation: 30
  ],[
    name: "Tequila",
    details: "Have a shot of Tequila",
    time_allocation: 30
  ],[
    name: "Rock, Paper, Scissors",
    details: "Play a game of of Rock, Papper, Scissors. Winner pours half his drink into the losers glass.",
    time_allocation: 30
  ],[
    name: "Chuck Norris",
    details: "Everybody gets a Chuck Norris shot. 1 part bourbon, 1 part tequila, tabasco on top.",
    time_allocation: 30
  ],[
    name: "Opposite handed",
    details: "From now on - drink with the opposite hand. Forfeit is downing your drink.",
    time_allocation: 30
  ],[
    name: "Mexican Wave",
    details: "Stand in a line and down your drinks one by one. If you take a break, forfeit is a shot of tequila.",
    time_allocation: 30
  ],[
    name: "Flaming Sambuca",
    details: "Order a flaming Sambuca",
    time_allocation: 30
  ],[
    name: "Cheers!",
    details: "Drink a stranger's drink.",
    time_allocation: 30
  ],[
    name: "The Accent Pub",
    details: "Speak in an accent till you finish your drink.",
    time_allocation: 30
  ],[
    name: "The Silent pub",
    details: "Remain straight faced and silent till you finish your drink.",
    time_allocation: 30
  ],[
    name: "Partner",
    details: "Partner up. You can only drink your drink if fed by your partner.",
    time_allocation: 30
  ],[
    name: "The Game",
    details: "Nobody is allowed to say the word 'mine' for the rest of the evening. 5 pushups is the forfeit",
    time_allocation: 30
  ],[
    name: "Random Item",
    details: "Last person to finish their drink must find and carry a random item with them for the rest of the evening.",
    time_allocation: 30
  ],[
    name: "Fancy cocktail round",
    details: "Everyone must order a fancy cocktail",
    time_allocation: 30
  ],[
    name: "Selfie with a stranger",
    details: "Each take a selfie with a stranger and upload it to any social network.",
    time_allocation: 30
  ],[
    name: "Business Card",
    details: "Get a stranger's business card within 3 minutes, without saying business card. Business card can then be used as a free pass for one future challenge.",
    time_allocation: 30
  ],[
    name: "In my pants",
    details: "Finish every sentence off with 'in my pants' whilest at this pub.",
    time_allocation: 30
  ],[
    name: "Cheesy Joke",
    details: "Everybody tells a cheesy joke. Voted loser has to ask a stranger if they can lick their cheese.",
    time_allocation: 30
  ]]


challenges.length.times { |n| Challenge.create(challenges[n]) }
