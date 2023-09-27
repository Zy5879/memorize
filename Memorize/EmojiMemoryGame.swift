//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zaire McAllister on 9/26/23.
//

import SwiftUI

class EmojiMemoryGame {
    private static let emojis = ["👻","🎃","🕷️","😈","💀", "👽","👺","🥷🏿","🤡"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
                return emojis[pairIndex]
            }
    }

    private var model = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
