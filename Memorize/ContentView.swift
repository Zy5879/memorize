//
//  ContentView.swift
//  Memorize
//
//  Created by Zaire McAllister on 9/11/23.
//

//  Views are immuatable

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    let emojis: Array<String> = ["👻","🎃","🕷️","😈","💀", "👽","👺","🥷🏿","🤡"]
    
    @State var newEmojis: Array<String> = []
    
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .bold()
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<newEmojis.count, id: \.self) { index in
                CardView(content: newEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            Spacer()
            themeAdjuster(of: "car", symbol: "car.side.fill")
            Spacer()
            themeAdjuster(of: "halloween", symbol: "theatermasks.fill")
            Spacer()

        }
        .imageScale(.large)
//        .font(.largeTitle)
    }
    
    
    func cardCountAdjuster(by offSet: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offSet
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offSet < 1 || cardCount + offSet > emojis.count)
    }
    
    func themeAdjuster(of theme: String, symbol: String) -> some View {
        VStack {
            Button(action: {
                if theme == "car" {
                    newEmojis = ["🚗","🚎","🚔","🏍️","🚕","🚙","🚌","🚎","🏎️", "🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚘","🚖"]
                    return newEmojis.shuffle()
                } else if theme == "halloween" {
                    newEmojis = ["👻","🎃","🕷️","😈","💀", "👽","👺","🥷🏿","🤡"]
                    return newEmojis.shuffle()
                }
            }, label: {
                Image(systemName: symbol)
            })
            Text(theme)
        }
       
    }
    
    var carTheme: some View {
        themeAdjuster(of: "car", symbol:"car.side")
    }
    
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
}


struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            // Type inference
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
