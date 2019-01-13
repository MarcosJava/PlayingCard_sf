//
//  ViewController.swift
//  PlayingCard
//
//  Created by Marcos Felipe Souza on 05/01/19.
//  Copyright © 2019 Marcos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.right, .left]
            
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizeBy:)))
            playingCardView.addGestureRecognizer(pinch)
            playingCardView.addGestureRecognizer(swipe)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func nextCard() {
        guard let card = deck.draw() else { return }
        playingCardView.rank = card.rank.order
        playingCardView.suit = card.suit.rawValue
    }

    @IBAction func turnedCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            self.playingCardView.isFaceUp = !self.playingCardView.isFaceUp
        default:
            break;
        }
    }
    
}

