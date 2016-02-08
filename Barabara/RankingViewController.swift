//
//  RankingViewController.swift
//  Barabara
//
//  Created by Karin on 2016/02/08.
//  Copyright © 2016年 Karin. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    
    @IBOutlet var rankLabel1:UILabel!
    @IBOutlet var rankLabel2:UILabel!
    @IBOutlet var rankLabel3:UILabel!
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        rankLabel1.text = String(defaults.integerForKey("score1"))
        rankLabel2.text = String(defaults.integerForKey("score2"))
        rankLabel3.text = String(defaults.integerForKey("score3"))
        
        
        // Do any additional setup after loading the view.
    }

//    
//    @IBAction func toTop(){
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
    
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
