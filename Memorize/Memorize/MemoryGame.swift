//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ahmed Ghalab on 7/25/20.
//  Copyright © 2020 Ahmed Ghalab. All rights reserved.
//

import Foundation


struct MemoryGame <CardContent> {
    var cards : Array<Card>
    
    mutating func choose(card: Card) {
        print("card chosen \(card)")
        let cardIndex = index(of: card)
        cards[cardIndex].isFaceUp = !cards[cardIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for cardIndex in 0..<cards.count {
            if card.id == cards[cardIndex].id {
                return cardIndex
            }
        }
        return 0 //TODO: change it
    }
    
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card : Identifiable{
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
