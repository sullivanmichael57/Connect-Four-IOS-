//
//  ViewController.swift
//  Connect Four
//
//  Created by Michael Sullivan1 on 5/1/18.
//  Copyright © 2018 Michael Sullivan's Crappy Programs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet var RedCollection: [UIImageView]!
    @IBOutlet weak var Red2: UIImageView!
    @IBOutlet weak var Red1: UIImageView!
    @IBOutlet weak var Backg: UIImageView!
    @IBOutlet weak var Red3: UIImageView!
    @IBOutlet weak var Red4: UIImageView!
    @IBOutlet weak var Red5: UIImageView!
    @IBOutlet weak var Red6: UIImageView!
    @IBOutlet weak var Red7: UIImageView!
    @IBOutlet weak var Red8: UIImageView!
    @IBOutlet weak var Red9: UIImageView!
    @IBOutlet weak var Red10: UIImageView!
    @IBOutlet weak var Red11: UIImageView!
    @IBOutlet weak var Red12: UIImageView!
    @IBOutlet weak var Red13: UIImageView!
    @IBOutlet weak var Red14: UIImageView!
    @IBOutlet weak var Red15: UIImageView!
    @IBOutlet weak var Red16: UIImageView!
    @IBOutlet weak var Red17: UIImageView!
    @IBOutlet weak var Red18: UIImageView!
    @IBOutlet weak var Red19: UIImageView!
    @IBOutlet weak var Red20: UIImageView!
    @IBOutlet weak var Red21: UIImageView!
    @IBOutlet weak var Red22: UIImageView!
    @IBOutlet weak var Red23: UIImageView!
    @IBOutlet weak var Red24: UIImageView!
    @IBOutlet weak var Red25: UIImageView!
    @IBOutlet weak var Red26: UIImageView!
    @IBOutlet weak var Red27: UIImageView!
    @IBOutlet weak var Red28: UIImageView!
    @IBOutlet weak var Red29: UIImageView!
    @IBOutlet weak var Red30: UIImageView!
    @IBOutlet weak var Red31: UIImageView!
    @IBOutlet weak var Red32: UIImageView!
    @IBOutlet weak var Red33: UIImageView!
    @IBOutlet weak var Red34: UIImageView!
    @IBOutlet weak var Red35: UIImageView!
    @IBOutlet weak var Red36: UIImageView!
    @IBOutlet weak var Red37: UIImageView!
    @IBOutlet weak var Red38: UIImageView!
    @IBOutlet weak var Red39: UIImageView!
    @IBOutlet weak var Red40: UIImageView!
    @IBOutlet weak var Red41: UIImageView!
    @IBOutlet weak var Red42: UIImageView!
    @IBOutlet weak var PlayerLabel: UILabel!

    enum Turn{case red;case blue;case empty}
    var CurrentTurn: Turn = .red
    var TurnNum: Int = 0;
    var Columns: [Int] = [0,0,0,0,0,0,0,0,0]
    var Board: [[Turn]] = [[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    @IBAction func StartButtonPressed(_ sender: Any) {
        StartButton.isHidden = true;
        Backg.isHidden = false;
        for i in self.RedCollection.indices{
            RedCollection[i].isHidden = true;
        }
        Board = [[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty],[.empty,.empty,.empty,.empty,.empty,.empty]]
        Columns = [0,0,0,0,0,0,0,0,0]
        TurnNum = 0
        CurrentTurn = .red
        PlayerLabel.text = "Red Player's Turn"
        PlayerLabel.textColor = UIColor.red
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (StartButton.isHidden == false){return;}
        let touch : UITouch! = touches.first! as UITouch
        let BeganLocation = touch.location(in: self.view)
        UIView.animate(withDuration: 0.01, animations: {
            self.RedCollection[self.TurnNum].frame = CGRect(x: BeganLocation.x, y:300, width:27, height: 27)
        }) { (true) in
            if (self.CurrentTurn == .red) {
                self.RedCollection[self.TurnNum].image = #imageLiteral(resourceName: "red circle").self
            }else {
                self.RedCollection[self.TurnNum].image = #imageLiteral(resourceName: "blue circle").self
            }
            self.RedCollection[self.TurnNum].isHidden = false;
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch! = touches.first! as UITouch;
        let BeganLocation = touch.location(in: self.view)
        UIView.animate(withDuration: 0.01) {
            self.RedCollection[self.TurnNum].frame = CGRect(x: BeganLocation.x, y: 300, width: 27, height: 27)
        }
    }


    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Red1 Tapped")
        if (TurnNum >= 42){return}
        if (StartButton.isHidden != true){return}
        let touchEnd : UITouch! = touches.first! as UITouch;
        let taploc = touchEnd.location(in: self.view)
        
        var intX = Int((taploc.x-33)/44) //intX is the column to drop in
        if intX >= 7 { // makes intX
            intX = 6
        }
        Drop(circle: self.TurnNum, column: intX);
    }
    

    
   
    
    func Drop(circle: Int, column: Int){
        if (self.Columns[column] > 5){return}
        print(column)
        UIView.animate(withDuration: 0, animations: {
            self.RedCollection[self.TurnNum].frame=CGRect(x: 39+45*column, y: 300, width: 27, height: 27)
        })  { (true) in
            print(self.RedCollection[self.TurnNum].frame)
        }
        
        if CurrentTurn == .red {
            self.Board[column][self.Columns[column]] = self.CurrentTurn;
            CurrentTurn = .blue;
            PlayerLabel.text = "Blue Player's Turn"
            PlayerLabel.textColor = UIColor.blue
        } else {
            self.Board[column][self.Columns[column]] = self.CurrentTurn;
            CurrentTurn = .red
            PlayerLabel.text = "Red Player's Turn"
            PlayerLabel.textColor = UIColor.red
        }
        RedCollection[self.TurnNum].isHidden = false;
        UIView.animate(withDuration: 1, animations: {
            //  let xInit: Int = Int(self.RedCollection[0].frame.minX);
            self.RedCollection[circle].frame=CGRect(x: Int(self.RedCollection[circle].frame.minX), y: 535-40*self.Columns[column], width: 27, height: 27)
        })
        
        Columns[column] = Columns[column]+1
        TurnNum = TurnNum+1;
     /*   for i in 0...5 { // Used to look at game board
            print(Board[0][-(i-5)],Board[1][-(i-5)],Board[2][-(i-5)],Board[3][-(i-5)],Board[4][-(i-5)],Board[5][-(i-5)],Board[6][-(i-5)])
        }*/
        if self.Winner() == true {
            if CurrentTurn == .blue {self.PlayerLabel.text = "Red Player Wins"; self.PlayerLabel.textColor = UIColor.red;}
            if CurrentTurn == .red {self.PlayerLabel.text = "Blue Player Wins"; self.PlayerLabel.textColor = UIColor.blue;}
            print("Winner Deteced")
            StartButton.isHidden = false;
            StartButton.setTitle("Reset", for: UIControlState.normal)
        }
        
    }
    
    
    func Winner() -> Bool{
        var Win: Bool = false
        //horizontal
        xLoop: for i in 0...3{ //x value
            yLoop: for j in 0...5{ //y value
                if (Board[i][j] == .empty){continue yLoop}
                countLoop: for n in 0...3{ //counts 4 in a row
                    let CTile: Turn=Board[i][j]
                    if Board[i+n][j] != CTile{continue yLoop}
                }
                print("Horizontal Winner")
                Win = true
            }
        }
        //vertical
        xLoop: for i in 0...6 { //x value
            yLoop: for j in 0...2{ //y value
                if (Board[i][j] == .empty){continue yLoop}
                countLoop: for n in 0...3{ //counts 4 in a row
                    let CTile: Turn=Board[i][j]
                    if Board[i][j+n] != CTile{continue yLoop}
                }
                print("Vertical Winner")
                Win = true
            }
        }
        //right diagonal
        xLoop: for i in 0...3 { //x value
            yLoop: for j in 0...2{ //y value
                if (Board[i][j] == .empty){continue yLoop}
                countLoop: for n in 0...3{ //counts 4 in a row
                    let CTile: Turn=Board[i][j]
                    if Board[i+n][j+n] != CTile{continue yLoop}
                }
                print("Right Diagonal Winner")
                Win = true
            }
        }
        //left diagonal
        xLoop: for i in 3...6 { //x value
            yLoop: for j in 0...2{ //y value
                if (Board[i][j] == .empty){continue yLoop}
                countLoop: for n in 0...3{ //counts 4 in a row
                    let CTile: Turn=Board[i][j]
                    if Board[i-n][j+n] != CTile{continue yLoop}
                }
                print("Left Diagonal Winner")
                Win = true
            }
        }
        return Win
    }


}
