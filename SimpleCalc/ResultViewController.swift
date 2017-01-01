//
//  ResultViewController.swift
//  SimpleCalc
//
//  Created by 藤本健悟 on 2016/12/29.
//  Copyright © 2016年 kengo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var data = CalcData()
    var result: String = ""
    var adifference: Int = 0
    var bdifference: Int = 0
    var cdifference: Int = 0
    var pay1: Int = 0
    var pay2: Int = 0
    var pay3: Int = 0
    
    @IBOutlet weak var resulttextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(data)
        
        switch  data.indicator {
        case 0:
            result = String((Int(data.cost)! / Int(data.member)!))
            resulttextView.text = "一人あたりのお会計は\(result)円です"
        case 1:

            if data.apayFlag == 1{
            adifference = data.percost - Int(data.acost)!
            }else if data.acost != ""{
            adifference = Int(data.acost)! - data.percost
            }
            if data.bpayFlag == 1{
                bdifference = data.percost - Int(data.bcost)!
            }else if data.bcost != ""{
                bdifference = Int(data.bcost)! - data.percost
            }
            if data.cpayFlag == 1{
                bdifference = data.percost - Int(data.ccost)!
            }else if data.ccost != ""{
                cdifference = Int(data.ccost)! - data.percost
            }
            
            result = String((Int(data.cost)! / Int(data.member)!))
            //resulttextView.text = "一人あたりのお会計は\(result)円です"
            
            switch data.paymember {
            //立て替えした人数が3人の場合
            case 3:
                if data.apayFlag == 1 && data.bpayFlag == 1{
                    pay1 = cdifference - (adifference + bdifference) / (Int(data.member)! - data.paymember)
                    resulttextView.text = "一人あたりのお会計は\(result)円です \n A から C に\(adifference)円 \n B から C に\(bdifference)円 \n その他メンバは \(pay1)円"
                }else if data.bpayFlag == 1 && data.cpayFlag == 1{
                    pay1 = adifference - (bdifference + cdifference) / (Int(data.member)! - data.paymember)
                    resulttextView.text = "一人あたりのお会計は\(result)円です \n B から A に\(bdifference)円 \n C から A に\(cdifference)円 \n その他メンバは \(pay1)円"
                }else if data.cpayFlag == 1 && data.apayFlag == 1{
                    pay1 = bdifference - (adifference + cdifference) / (Int(data.member)! - data.paymember)
                    resulttextView.text = "一人あたりのお会計は\(result)円です \n C から B に\(cdifference)円 \n A から B に\(adifference)円 \n その他メンバは \(pay1)円"
                }else if data.apayFlag == 1 {
                    pay1 = bdifference - (adifference / 2) / (Int(data.member)! - data.paymember)
                    pay2 = cdifference - (adifference / 2) / (Int(data.member)! - data.paymember)
                    resulttextView.text = "一人あたりのお会計は\(result)円です \n A から B に\(adifference / 2)円 \n A から C に\(adifference / 2)円 \n その他メンバは Bに\(pay1) \n Cに\(pay2)円"
                }else if data.bpayFlag == 1 {
                    pay1 = adifference - (bdifference / 2) / (Int(data.member)! - data.paymember)
                    pay2 = cdifference - (bdifference / 2) / (Int(data.member)! - data.paymember)
                    resulttextView.text = "一人あたりのお会計は\(result)円です \n B から A に\(adifference / 2)円 \n B から C に\(bdifference / 2)円 \n その他メンバは Aに\(pay1) \n Cに\(pay2)円"
                }else if data.cpayFlag == 1 {
                    pay1 = adifference - (cdifference / 2) / (Int(data.member)! - data.paymember)
                    pay2 = bdifference - (cdifference / 2) / (Int(data.member)! - data.paymember)
                    resulttextView.text = "一人あたりのお会計は\(result)円です \n C から A に\(cdifference / 2)円 \n C から B に\(cdifference / 2)円 \n その他メンバは Aに\(pay1) \n Bに\(pay2)円"
                }
                
            //立て替えした人数が2人の場合
            case 2:
                if data.apayFlag == 1 {
                    pay1 = bdifference - adifference / (Int(data.member)! - data.paymember)
                    resulttextView.text = "一人あたりのお会計は\(result)円です \n A から B に\(adifference)円 \n その他メンバは Bに\(pay1)円"
                }else if data.bpayFlag == 1{
                    pay1 = adifference - bdifference / (Int(data.member)! - data.paymember)
                    resulttextView.text = "一人あたりのお会計は\(result)円です \n B から A に\(bdifference)円 \n その他メンバは Aに\(pay1)円"
                }
            //立て替えした人数が1人の場合
            case 1:
                pay1 = Int(data.cost)! / (Int(data.member)! - data.paymember)
                resulttextView.text = "一人あたりのお会計は\(result)円です \n その他メンバは \(pay1)円"
                
            default: break
            }
            
        default: break
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
