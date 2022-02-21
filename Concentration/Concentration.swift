//
//  Concentration.swift
//  Concentration
//
//  Created by Vasile Sebastian Catur on 18.02.2022.
//

import Foundation
import UIKit

class Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    var halloweenEmojiTheme = Theme(backgroundColor: .orange, emojiList: ["🎃", "👻", "😈", "💀", "🦇", "🙀", "🍭", "🍬", "😱", "🍎", "👹", "👺"])
    var animalsEmojiTheme = Theme(backgroundColor: .red, emojiList: ["🐶", "🐱", "🐹", "🦊", "🐻", "🐼", "🐨", "🦁", "🐮", "🐷", "🐔", "🐴"])
    var foodEmojiTheme = Theme(backgroundColor: .blue, emojiList: ["🍔", "🍟", "🍎", "🍐", "🍊", "🍌", "🍉", "🍇", "🍓", "🫐", "🥑", "🥭"])
    var sportsEmojiTheme = Theme(backgroundColor: .green, emojiList: ["🎯", "🧗🏻", "🚵‍♀️", "🚴‍♂️", "🤸‍♂️", "🚣‍♂️", "🏄‍♂️", "🏊‍♀️", "⛹️‍♀️", "🤺", "⛷", "🤼‍♀️"])
    var carsEmojiTheme = Theme(backgroundColor: .gray, emojiList: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🛻", "🚚", "🚜"])
    var electronicsEmojiTheme = Theme(backgroundColor: .purple, emojiList: ["⌚️", "📱", "💻", "🖥", "🖨", "🖲", "🕹", "💾", "☎️", "📟", "📺", "🎙"])
    var flipCount = 0


    init(numberOfPearsOfCards: Int) {
        for _ in 1...numberOfPearsOfCards {
            let card = Card()
            cards += [card, card]
        }
        shuffleCards()
    }

    func chooseCard(at index: Int) {
        flipCount += 1
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                    // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    func shuffleCards() {
        cards = cards.shuffled()
    }

    func randomTheme() -> Theme {
        let themeList = [halloweenEmojiTheme, sportsEmojiTheme, animalsEmojiTheme, foodEmojiTheme, carsEmojiTheme, electronicsEmojiTheme]
        return themeList.randomElement() ?? halloweenEmojiTheme
    }

}
