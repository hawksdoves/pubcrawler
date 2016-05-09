# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times { |n| Challenge.create(challenges[n]) }


  challenges = [{
    name: "Glass of Wine",
    details: "Order a glass of wine",
    time_allocation: "30"
  },{
    name: "Pint of Black",
    details: "Order a pint of Black beer",
    time_allocation: "30"
  },{
    name: "Three sips",
    details: "Your next drink must be drunk in three sips",
    time_allocation: "30"
  },{
    name: "Find a friend",
    details: "Take a photo with somebody who's name begins with the letter 'N'",
    time_allocation: "30"
  },{
    name: "Group Photo",
    details: "Take a group picture with your drinks empty",
    time_allocation: "30"
  },{
    name: "Tequila",
    details: "Have a shot of Tequila",
    time_allocation: "30"
  },{
    name: "Rock, Paper, Scissors",
    details: "Play a game of of Rock, Papper, Scissors. Winner pours half his drink into the losers glass.",
    time_allocation: "30"
  },{
    name: "Chuck Norris",
    details: "Ask the bartender for a Chuck Norris shot",
    time_allocation: "30"
  },{
    name: "Opposite handed",
    details: "From now on - drink with the opposite hand. Forfeit is downing your drink.",
    time_allocation: "30"
  },{
    name: "Mexican Wave",
    details: "Stand in a line and down your drinks one by one. If you take a break, forfeit is a shot of tequila.",
    time_allocation: "30"
  },{
    name: "Flaming Sambuca",
    details: "Order a flaming Sambuca",
    time_allocation: "30"
  },{
    name: "Cheers!",
    details: "Drink a stranger's drink.",
    time_allocation: "30"
  },{
    name: "The Accent Pub",
    details: "Speak in an accent till you finish your drink.",
    time_allocation: "30"
  },{
    name: "The Silent pub",
    details: "Remain straight faced and silent till you finish your drink.",
    time_allocation: "30"
  },{
    name: "Partner",
    details: "Partner up. You can only drink your drink if fed by your partner.",
    time_allocation: "30"
  },{
    name: "The Game",
    details: "Nobody is allowed to say the word 'mine' for the rest of the evening. 5 pushups is the forfeit",
    time_allocation: "30"
  },{
    name: "Random Item",
    details: "Last person to finish their drink must carry a random item. Next pub one must ceremoneously pass on another item to the next person.",
    time_allocation: "30"
  },{
    name: "Fancy cocktail round",
    details: "Everyone must order a fancy cocktail",
    time_allocation: "30"
  },{
    name: "Selfie with a stranger",
    details: "Each take a selfie with a stranger and upload it to any social network.",
    time_allocation: "30"
  },{
    name: "Business Card",
    details: "Get a stranger's business card within 3 minutes. Business card can then be used as a free pass for one future challenge.",
    time_allocation: "30"
  }]
