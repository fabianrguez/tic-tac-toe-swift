//
//  PlayViewController.swift
//  tic-tac-toe
//
//  Created by Fabián Rodríguez Gámez on 22/2/18.
//  Copyright © 2018 Fabián Rodríguez Gámez. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var isActiveGame = true
    let winnerCombination = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBAction func action(_ sender: UIButton) {
        if (isActiveGame) {
            if (gameState[sender.tag - 1] == 0) {
                gameState[sender.tag - 1] = activePlayer;
                if (activePlayer == 1) {
                    sender.setImage(UIImage(named: "X.png"), for: UIControlState())
                    activePlayer = 2
                } else {
                    sender.setImage(UIImage(named: "O.png"), for: UIControlState())
                    activePlayer = 1
                }
            }
            checkGameStatus()
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isActiveGame = true;
        activePlayer = 1
        newGameButton.isHidden = true;
        winnerLabel.isHidden = true;
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkGameStatus() {
        for combinations in winnerCombination {
            if (gameState[combinations[0]] != 0 &&
                gameState[combinations[0]] == gameState[combinations[1]] &&
                gameState[combinations[1]] == gameState[combinations[2]]) {
                isActiveGame = false
                if (gameState[combinations[0]] == 1) {
                    winnerLabel.text = "❌ Gana!"
                } else {
                    winnerLabel.text = "⭕️ Gana!"
                }
                newGameButton.isHidden = false;
                winnerLabel.isHidden = false;
            }
        }
        isActiveGame = false;
        for i in gameState {
            if (i == 0) {
                isActiveGame = true
                break;
            }
        }
        if (isActiveGame == false ) {
            winnerLabel.text = "Empate!"
            winnerLabel.isHidden = false
            newGameButton.isHidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
