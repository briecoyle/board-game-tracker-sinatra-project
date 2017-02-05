@brie = User.create(username: "brie", password: "123")
@stephen = User.create(username: "stephen", password: "456")

@ah = BoardGame.create(name: "Arkham Horror", min_players: 1, max_players: 8, description: "Arkham Horror is a cooperative game for 1-8 players ages 12 and up, and can be played in 2-3 hours.")

@monopoly = BoardGame.create(name: "Monopoly", min_players: 2, max_players: 4, description: "Build your fortune as you buy, sell and trade the world’s most famous properties. It’s classic Monopoly fun!")

@tokaido = BoardGame.create(name: "Tokaido", min_players: 2, max_players: 5, description: "Each player is a traveler crossing the 'East Sea Road', one of the most magnificent roads of Japan. While traveling, players will meet people, taste fine meals, collect beautiful items, discover great panoramas and visit temples and wild places. At the end of the day, when everyone has arrived at the end of the road you'll have to be the most initiated traveler – which means that you'll have to be the one who discovered the most interesting and varied things.")

@brie.board_games << @ah
@brie.board_games << @monopoly

@stephen.board_games << @ah
@stephen.board_games << @tokaido
