//
//  ViewController.swift
//  CardGame
//
//  Created by Hongrun Xin on 10/6/20.
//  Copyright © 2020 edu.northeastern.HongrunXin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    
    @IBOutlet weak var card4: UIImageView!
    @IBOutlet weak var card5: UIImageView!
    @IBOutlet weak var card6: UIImageView!
    
    @IBOutlet weak var result: UILabel!
    
    var card1Value = -1
    var card2Value = -1
    var card3Value = -1
    var card4Value = -1
    var card5Value = -1
    var card6Value = -1
    var resultNum = "Display winner"
    var cardList = [Int]()
    let imageNames = ["2C","2D","2H","2S","3C","3D","3H","3S","4C","4D","4H","4S","5C","5D","5H","5S","6C","6D","6H","6S","7C","7D","7H","7S","8C","8D","8H","8S","9C","9D","9H","9S","10C","10D","10H","10S","JC","JD","JH","JS","QC","QD","QH","QS","KC","KD","KH","KS","AC","AD","AH","AS",]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResult()
    }
    
    func playCards(){
//        card1Value = Int.random(in: 0..<52)
//        card2Value = Int.random(in: 0..<52)
//        card3Value = Int.random(in: 0..<52)
//
//        card4Value = Int.random(in: 0..<52)
//        card5Value = Int.random(in: 0..<52)
//        card6Value = Int.random(in: 0..<52)
        cardList.removeAll()
        while (cardList.count <= 6){
            let tmp = Int.random(in: 0..<52)
            if (!cardList.contains(tmp)) {
                cardList.append(tmp)
            }
        }

        card1.image = UIImage(named: imageNames[cardList[0]])
        card2.image = UIImage(named: imageNames[cardList[1]])
        card3.image = UIImage(named: imageNames[cardList[2]])
        
        card4.image = UIImage(named: imageNames[cardList[3]])
        card5.image = UIImage(named: imageNames[cardList[4]])
        card6.image = UIImage(named: imageNames[cardList[5]])

    }

    
    @IBAction func Play(_ sender: UIButton) {
        print("000")
        playCards()
        if (cardList[0] == 51 || cardList[1] == 51 || cardList[2] == 51) {
            resultNum = "Player 1 wins"
            print("111")
            updateResult()
            
            let alert = UIAlertController(title: "Play Again?", message: "Press to choose", preferredStyle: .alert)
            
            let yes = UIAlertAction(title: "Yes", style: .default) { (action) in
                print("Continue")
            }
            let no = UIAlertAction(title: "No", style: .cancel) { (action) in
                print("Stop")
            }
            
            alert.addAction(yes)
            alert.addAction(no)
            
            self.present(alert, animated: true, completion: nil)
        }
        else if(cardList[3] == 51 || cardList[4] == 51 || cardList[5] == 51){
            resultNum = "Player 2 wins"
            print("222")
            updateResult()
            
            let alert = UIAlertController(title: "Play Again?", message: "Press to choose", preferredStyle: .alert)
            
            let yes = UIAlertAction(title: "Yes", style: .default) { (action) in
                print("Continue")
            }
            let no = UIAlertAction(title: "No", style: .cancel) { (action) in
                print("Stop")
            }
            
            alert.addAction(yes)
            alert.addAction(no)
            
            self.present(alert, animated: true, completion: nil)
        }
        else{
            resultNum = "No winner"
            print("333")
            updateResult()
        }
            
    }
    func updateResult(){
        result.text = "\(resultNum)"
    }
}

