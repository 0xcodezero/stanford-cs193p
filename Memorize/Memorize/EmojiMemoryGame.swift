//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ahmed Ghalab on 7/25/20.
//  Copyright © 2020 Ahmed Ghalab. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject{
    @Published private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    static func createMemoryGame () -> MemoryGame<String> {
        var emojis = ["👻", "🚇", "🕷", "🙁", "🐝", "🐹", "🐸", "🐙", "🐬", "🦆" , "🐓", "🐫"]
        emojis.shuffle()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) {  pairIndex in emojis[pairIndex] }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    // MARK: - Intent
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
