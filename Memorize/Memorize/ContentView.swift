//
//  ContentView.swift
//  Memorize
//
//  Created by Ahmed Ghalab on 7/25/20.
//  Copyright © 2020 Ahmed Ghalab. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel : EmojiMemoryGame 
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(viewModel.cards.count > 4 ? Font.subheadline : Font.largeTitle)
        
    }
}


struct CardView : View{
    var card : MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if (card.isFaceUp){
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke()
                Text(card.content)
            }else{
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        return ContentView(viewModel: game)
    }
}
