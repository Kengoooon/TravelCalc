//
//  ResultViewController.swift
//  SimpleCalc
//
//  Created by 藤本健悟 on 2016/12/29.
//  Copyright © 2016年 kengo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
   
    @IBOutlet weak var backgroundView: UIView!
    
    var data = CalcData()
    var result: String = ""
    var adifference: Int = 0
    var bdifference: Int = 0
    var cdifference: Int = 0
    var pay1: String = ""
    var pay2: String = ""
    var pay3: String = ""
    
    func resultCalc(roundingCost:Int) -> String{
        
        switch roundingCost {
        case 1:
            result = String(format:"%g",(ceil((Double(result)! / 1)) * 1))
        case 10:
            result = String(format:"%g",(ceil((Double(result)! / 10)) * 10))
        case 100:
            result = String(format:"%g",(ceil((Double(result)! / 100)) * 100))
        case 500:
            result = String(format:"%g",(ceil((Double(result)! / 500)) * 500))
        default:
            break
        }
        return result
    }
    
    func resultConv(res:Int) -> String{
        
        switch data.roundingCost {
        case 1:
            result = String(format:"%g",(ceil((Double(res) / 1)) * 1))
        case 10:
            result = String(format:"%g",(ceil((Double(res) / 10)) * 10))
        case 100:
            result = String(format:"%g",(ceil((Double(res) / 100)) * 100))
        case 500:
            result = String(format:"%g",(ceil((Double(res) / 500)) * 500))
        default:
            break
        }
        return result
    }
    
    @IBOutlet weak var resulttextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func resultOutput(){
            if data.cost != "" && data.member != ""{
                if data.acost != "" && data.bcost != "" && data.ccost != ""{
                    result = String((Int(data.cost)! - (Int(data.acost)! + Int(data.bcost)!  + Int(data.ccost)!)) / (Int(data.member)! - 3))
                    resulttextView.text = "Aさんは\(data.acost)円\nBさんは\(data.bcost)円\nCさんは\(data.ccost)円\n一人あたりのお会計は\(result)円です"
                }else if (data.acost != "" && data.bcost != "") {
                    result = String((Int(data.cost)! - (Int(data.acost)! + Int(data.bcost)!)) / (Int(data.member)! - 2))
                    resulttextView.text = "Aさんは\(data.acost)円\nBさんは\(data.bcost)円\n一人あたりのお会計は\(result)円です"
                }else if data.acost != ""{
                    result = String((Int(data.cost)! - Int(data.acost)!) / (Int(data.member)! - 1))
                    resulttextView.text = "Aさんは\(data.acost)円\n一人あたりのお会計は\(result)円です"
                }else{
                    result = String(Int(data.cost)! / (Int(data.member)!))
                    result = resultCalc(roundingCost: data.roundingCost)
                    resulttextView.text = "一人あたりのお会計は\(result)円です"
                }
            }else{
                resulttextView.text = "Error!入力がありませんでした。"
            }
        }
        
        func postResult(round: Double){
        if data.cost != "" || data.member != ""{
            
            //立て替えをした人の立て替え金額と一人当たりの金額の差額を計算
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
                cdifference = data.percost - Int(data.ccost)!
            }else if data.ccost != ""{
                cdifference = Int(data.ccost)! - data.percost
            }
            result = String(format:"%g",(ceil((Double(data.cost)! / Double(data.member)!) / round) * round))
 
        
            switch data.paymember {
            //立て替えした人数が3人の場合
            case 3:
                if data.apayFlag == 1 && data.bpayFlag == 1{
                    
                    
                    pay1 = String(format:"%g",(ceil(Double((cdifference - (adifference + bdifference)) / (Int(data.member)! - data.paymember)) / round ) * round))
                    resulttextView.text = "一人あたりのお会計は\(result)円です\n\(data.cname)は支払いはありません\n \(data.aname)から\(data.cname)に\(resultConv(res:(adifference)))円\n\(data.bname)から\(data.cname) に\(resultConv(res:(bdifference)))円\n立て替えしなかったメンバは\(pay1)円払いましょう"
                }else if data.bpayFlag == 1 && data.cpayFlag == 1{
                    pay1 = String(format:"%g",(ceil(Double((adifference - (bdifference + cdifference)) / (Int(data.member)! - data.paymember)) / round ) * round))
                    resulttextView.text = "一人あたりのお会計は\(result)円です\n\(data.aname)は支払いはありません\n\(data.bname)から\(data.aname)に\(resultConv(res:(bdifference)))円\n\(data.cname)から\(data.aname) に\(resultConv(res:(cdifference)))円\n立て替えしなかったメンバは\(pay1)円払いましょう"
                }else if data.cpayFlag == 1 && data.apayFlag == 1{
                    pay1 = String(format:"%g",(ceil(Double(bdifference - (adifference + cdifference) / (Int(data.member)! - data.paymember)) / round ) * round))
                    resulttextView.text = "一人あたりのお会計は\(result)円です\n\(data.bname)は支払いはありません\n \(data.cname)から\(data.bname)に\(resultConv(res:(cdifference)))円 \n\(data.aname)から\(data.bname)に\(resultConv(res:(adifference)))円\n立て替えしなかったメンバは\(pay1)円払いましょう"
                }else if data.apayFlag == 1 {
                    pay1 = String(format:"%g",(ceil(Double((bdifference - (adifference / 2)) / (Int(data.member)! - data.paymember)) / round ) * round))
                    pay2 = String(format:"%g",(ceil(Double((cdifference - (adifference / 2)) / (Int(data.member)! - data.paymember)) / round ) * round))
                    resulttextView.text = "一人あたりのお会計は\(result)円です\n\(data.bname)は支払いはありません\n\(data.cname)は支払いはありません\n\(data.aname)から\(data.bname)に\(resultConv(res:(adifference / 2)))円\n\(data.aname)から\(data.cname)に\(resultConv(res:(adifference / 2)))円\n立て替えしなかったメンバは\n\(data.bname)に\(pay1)円\n\(data.cname)に\(pay2)円払いましょう"
                }else if data.bpayFlag == 1 {
                    pay1 = String(format:"%g",(ceil(Double((adifference - (bdifference / 2)) / (Int(data.member)! - data.paymember)) / round ) * round))
                    pay2 = String(format:"%g",(ceil(Double((cdifference - (bdifference / 2)) / (Int(data.member)! - data.paymember)) / round ) * round))
                    resulttextView.text = "一人あたりのお会計は\(result)円です \n\(data.aname)は支払いはありません\n \(data.cname)は支払いはありません\n\(data.bname)から\(data.aname)に\(resultConv(res:(adifference / 2)))円\n\(data.bname)から\(data.cname)に\(resultConv(res:(bdifference / 2)))円\n立て替えしなかったメンバは\n\(data.aname)に\(pay1)円\n\(data.cname)に\(pay2)円払いましょう"
                }else if data.cpayFlag == 1 {
                    pay1 = String(format:"%g",(ceil(Double((adifference - (cdifference / 2)) / (Int(data.member)! - data.paymember)) / round ) * round))
                    pay2 = String(format:"%g",(ceil(Double((bdifference - (cdifference / 2)) / (Int(data.member)! - data.paymember)) / round ) * round))
                    resulttextView.text = "一人あたりのお会計は\(result)円です\n\(data.aname)は支払いはありません\n \(data.bname)は支払いはありません\n\(data.cname)から\(data.aname)に\(resultConv(res:(cdifference / 2)))円 \n\(data.cname)から\(data.bname)に\(resultConv(res:(cdifference / 2)))円\n立て替えしなかったメンバは\n\(data.aname)に\(pay1)円\n\(data.bname)に\(pay2)円払いましょう"
                }else{
                    pay1 = String(format:"%g",(ceil(Double(adifference  / (Int(data.member)! - data.paymember)) / round ) * round))
                    pay2 = String(format:"%g",(ceil(Double(bdifference  / (Int(data.member)! - data.paymember)) / round ) * round))
                    pay3 = String(format:"%g",(ceil(Double(cdifference  / (Int(data.member)! - data.paymember)) / round ) * round))
                    resulttextView.text = "一人あたりのお会計は\(result)円です\n\(data.aname)は支払いはありません\n\(data.bname)は支払いはありません\n\(data.cname)は支払いはありません\n立て替えしなかったメンバは\n\(data.aname)に\(pay1)円\n\(data.bname)に\(pay2)円\n\(data.cname)に\(pay3)円払いましょう"
                }
            //立て替えした人数が2人の場合
            case 2:
                if data.apayFlag == 1 {
                    pay1 = String(format:"%g",(ceil(Double((bdifference - adifference) / (Int(data.member)! - data.paymember)) / round) * round))
                    resulttextView.text = "一人あたりのお会計は\(result)円です\n\(data.bname)は支払いはありません\n\(data.aname)から\(data.bname)に\(resultConv(res:adifference))円\n立て替えしなかったメンバは\n\(data.bname)に\(pay1)円払いましょう"
                }else if data.bpayFlag == 1{
                    pay1 = String(format:"%g",(ceil(Double((adifference - bdifference) / (Int(data.member)! - data.paymember)) / round) * round))
                    resulttextView.text = "一人あたりのお会計は\(result)円です\n\(data.aname)は支払いはありません\n\(data.bname)から\(data.aname)に\(resultConv(res:bdifference))円\n立て替えしなかったメンバは\(data.aname)に\(pay1)円払いましょう"
                }else{
                    pay1 = String(format:"%g",(ceil(Double(adifference / (Int(data.member)! - data.paymember)) / round) * round))
                    pay2 = String(format:"%g",(ceil(Double(bdifference / (Int(data.member)! - data.paymember)) / round) * round))
                    resulttextView.text = "一人あたりのお会計は\(result)円です\n立て替えしなかったメンバは\n\(data.aname)に\(pay1)円\n\(data.bname)に\(pay2)円払いましょう"
                }
            //立て替えした人数が1人の場合
            case 1:
                pay1 = String(format:"%g",(ceil(Double( Int(data.cost)! / (Int(data.member)!)) / round) * round))
                resulttextView.text = "一人あたりのお会計は\(result)円です\n\(data.aname)は支払いはありません\n\(data.aname)に\(pay1)円払いましょう"
            default: break
            }
        }else{
            resulttextView.text = "Error！入力がありませんでした。"
        }
        }
        
        switch  data.indicator {
        //前精算の場合
        case 0:
            switch data.roundingCost{
            //1円単位での精算の場合
            case 1:
                resultOutput()
            case 10:
                resultOutput()
            case 100:
                resultOutput()
            case 500:
                resultOutput()
            default:break
            }
        
        //事後精算の場合
        case 1:

            if data.errorFlag != 1{
                switch data.roundingCost{
                //1円単位での精算の場合
                case 1:
                    postResult(round: 1)
                //10円単位での精算の場合
                case 10:
                    postResult(round: 10)
                //100円単位での精算の場合
                case 100:
                    postResult(round: 100)
                //500円単位での精算の場合
                case 500:
                    postResult(round: 500)
                default:break
                }
            }else{
                resulttextView.text = "Error！入力がありませんでした。"
            }
            default: break
            }
        
        
        //グラデーションの設定
        let gradientLayer = CAGradientLayer()
        //フレームを用意
        gradientLayer.frame = backgroundView.bounds
        
        //色を定義
        let color1 = UIColor(red: 0.4, green: 0.7, blue: 0.9, alpha: 1.0).cgColor as CGColor
        let color2 = UIColor(red: 0.1, green: 0.5, blue: 0.8, alpha: 1.0).cgColor as CGColor
        let color3 = UIColor.white.cgColor
        //グラデーションレイヤーに色を設定
        gradientLayer.colors = [color1, color2,color3]
        //始点・終点の設定
        gradientLayer.startPoint = CGPoint(x:0,y:0);
        gradientLayer.endPoint = CGPoint(x:1.0,y:0.8);
        //headerviewにグラデーションレイヤーを挿入
        backgroundView.layer.insertSublayer(gradientLayer,at:0)

            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
