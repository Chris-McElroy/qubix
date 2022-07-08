//
//  main.swift
//  qubix
//
//  Created by Chris McElroy on 5/20/22.
//

import Foundation

/*
 
 to run:
swiftc Board.swift Game.swift Checks.swift BoardHelper.swift GeneralHelper.swift KeyHelper.swift players/Player.swift players/User.swift players/Novice.swift players/Defender.swift players/Warrior.swift players/Tyrant.swift players/Oracle.swift players/Cubist.swift main.swift -o prog
 
  then:
 ./prog
 
 */

// mode: choose your opponent. from easiest to hardest:
//	.novice
//	.defender
//	.warrior
//	.tyrant
//	.oracle
//	.cubist
//	also available: .local for playing test games against yourself
// turn: 0 -> you go first, turn: 1 -> opponent goes first, turn: nil -> random
// manualPreset: false -> start from a blank board, manualPreset: true -> add any moves you want before the game starts

print("starting!")
Game.main.load(mode: .cubist, turn: 0, manualPreset: false)
Game.main.startGame()
