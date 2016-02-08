//
//  GameViewController.swift
//  Barabara
//
//  Created by Karin on 2016/02/08.
//  Copyright © 2016年 Karin. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    
    @IBOutlet var imgView1:UIImageView!
    @IBOutlet var imgView2:UIImageView!
    @IBOutlet var imgView3:UIImageView!
    
    @IBOutlet var resultLabel:UILabel!
    
    var gameTimer:NSTimer!
    var score:Int = 1000
    let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    let width:CGFloat = UIScreen.mainScreen().bounds.size.width//現在のiPhoneの画面サイズ
    var positionX:[CGFloat] = [0.0,0.0,0.0]//配列　CGFloat は少数。String,Intと宣言することもできる、
    var dx: [CGFloat] = [1.0,0.5,-1.0]
    
    
    
    func start (){
        resultLabel.hidden = true
        
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(0.005, target: self,selector: "up", userInfo: nil, repeats: true)
        //(呼び出す時間間隔, ”タイマーによって呼び出されるメソッド”, 繰り返すか繰り返さないか　true/false)
        
        gameTimer.fire()//タイマーを動かす
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        positionX = [width/2,width/2,width/2]//画像の位置、画面幅のまんなか
        self.start()//start()を呼び出す
        
        
        // Do any additional setup after loading the view.
        
    }
    
    func up(){
        for i in 0..<3 {
            if positionX[i] > width || positionX[i]<0{
                dx[i] = dx[i]*(-1)
            }
            positionX[i] += dx[i]
        }
        imgView1.center.x = positionX[0]//画像の移動　上から、並び順。
        imgView2.center.x = positionX[1]
        imgView3.center.x = positionX[2]
        
    }
    
    @IBAction func stop(){//ストップボタンを押した時に呼び出す
        
        if gameTimer.valid == true{
            gameTimer.invalidate()
        }
        for i in 0..<3{
            score = score - abs(Int(width/2 - positionX[i]))*2
        }
        
        resultLabel.text = "Score:" + String(score)
        resultLabel.hidden = false
        
        
        
        
        let highScore1:Int = defaults.integerForKey("score1")
        let highScore2:Int = defaults.integerForKey("Score2")
        let highScore3:Int = defaults.integerForKey("Score3")
        
        
        if score > highScore1{
            defaults.setInteger(score, forKey: "score1")
            defaults.setInteger(highScore1, forKey: "score2")
            defaults.setInteger(highScore2, forKey: "score3")
        }else if score > highScore2{
            defaults.setInteger(score, forKey: "score2")
            defaults.setInteger(highScore2, forKey: "score3")
        }else if score > highScore3{
            
            defaults.setInteger(score, forKey: "score3")
            
        }
        
        }
        
    
    
    @IBAction func retry(){
        score = 1000
        positionX = [width/2,width/2,width/2]
        self.start()
    
    }
    
    @IBAction func toTop(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
