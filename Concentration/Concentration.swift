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
    var halloweenEmojiTheme = Theme(backgroundColor: .orange, emojiList: ["ð", "ðŧ", "ð", "ð", "ðĶ", "ð", "ð­", "ðŽ", "ðą", "ð", "ðđ", "ðš"])
    var animalsEmojiTheme = Theme(backgroundColor: .red, emojiList: ["ðķ", "ðą", "ðđ", "ðĶ", "ðŧ", "ðž", "ðĻ", "ðĶ", "ðŪ", "ð·", "ð", "ðī"])
    var foodEmojiTheme = Theme(backgroundColor: .blue, emojiList: ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðŦ", "ðĨ", "ðĨ­"])
    var sportsEmojiTheme = Theme(backgroundColor: .green, emojiList: ["ðŊ", "ð§ðŧ", "ðĩââïļ", "ðīââïļ", "ðĪļââïļ", "ðĢââïļ", "ðââïļ", "ðââïļ", "âđïļââïļ", "ðĪš", "â·", "ðĪžââïļ"])
    var carsEmojiTheme = Theme(backgroundColor: .gray, emojiList: ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðŧ", "ð", "ð"])
    var electronicsEmojiTheme = Theme(backgroundColor: .purple, emojiList: ["âïļ", "ðą", "ðŧ", "ðĨ", "ðĻ", "ðē", "ðđ", "ðū", "âïļ", "ð", "ðš", "ð"])
    var flipCount = 0
    var scoreCount = 0


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
                    scoreCount += 2
                } else {
                    if cards[index].seen == true {
                        scoreCount -= 1
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                cards[index].seen = true
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
