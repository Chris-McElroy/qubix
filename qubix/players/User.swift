//
//  User.swift
//  qubix
//
//  Created by Chris McElroy on 5/20/22.
//

import SwiftUI

class User: Player {
	init(b: Board, n: Int, name: String? = nil) {
		var username = "you"
		if let name = name {
			username = name
		}
		super.init(b: b, n: n, name: username, color: 4, rounded: true)
	}
	
	override func move() {
		while true {
			print("your move:")
			let lineIn = readLine()
			guard lineIn != nil else { print("no answer"); return }
			guard let planeOffset = ["a": 0, "b": 16, "c": 32, "d": 48][lineIn?.first] else { print("abcd missing! try again"); continue }
			guard let num = Int(lineIn?.dropFirst() ?? ""), num >= 0 && num < 16 else { print("number error! try again"); continue }
			let p = planeOffset + num
			guard b.pointEmpty(p) else { print("point full! try again"); continue }
			Game.main.checkAndProcessMove(p, for: n, setup: b.getSetup())
			break
		}
//		premove()
	}
	
	func move(at p: Int) {
		if Game.main.reviewingGame {
			Game.main.processGhostMove(p)
		} else if Game.main.gameState == .active {
			if Game.main.premoves.isEmpty {
				Game.main.checkAndProcessMove(p, for: n, setup: b.getSetup())
			}
		}
	}
	
	func premove() {
		if Game.main.turn == n {
			if !Game.main.premoves.isEmpty {
				let p = Game.main.premoves.removeFirst()
				// clause for allowing checkmate premoves
				if let nextP = Game.main.premoves.first, b.pointFull(p) && b.getW1(for: n).contains(nextP) {
					Game.main.premoves = []
					Game.main.checkAndProcessMove(nextP, for: n, setup: b.getSetup())
				} else if (b.hasW1(n) != b.getW1(for: n).contains(p)) || b.pointFull(p) {
					Game.main.premoves = []
					Game.main.processingMove = true
					Game.main.processingMove = false
				} else {
					Game.main.checkAndProcessMove(p, for: n, setup: b.getSetup())
				}
			}
		}
	}
}
