//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Zaire McAllister on 9/26/23.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
 }
