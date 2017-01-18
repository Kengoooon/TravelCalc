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
    
    //丸め単位に応じた結果計算関数
    func resultCalc(roundingCost:RoundUnit) -> String{
        switch roundingCost {
        case .yen1:
            result = String(format:"%g",(ceil((Double(result)! / 1)) * 1))
        case .yen10:
            result = String(format:"%g",(ceil((Double(result)! / 10)) * 10))
        case .yen100:
            result = String(format:"%g",(ceil((Double(result)! / 100)) * 100))
        case .yen500:
            result = String(format:"%g",(ceil((Double(result)! / 500)) * 500))
        }
        return result
    }
    
    
    @IBOutlet weak var resulttextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //事前精算時の処理関数
        func resultOutput(){
            if data.cost != "" && data.member != ""{
                if data.acost != "" && data.bcost != "" && data.ccost != "" && data.acount != "" && data.bcount != "" && data.ccount != "" && Int(data.member)! > (Int(data.acount)! + Int(data.bcount)! + Int(data.ccount)!) && Int(data.cost)! >= (Int(data.acost)! + Int(data.bcost)! + Int(data.ccost)!){
                    result = String((Int(data.cost)! - (Int(data.acost)! * Int(data.acount)! + Int(data.bcost)! * Int(data.bcount)!  + Int(data.ccost)! * Int(data.ccount)!)) / (Int(data.member)! - (Int(data.acount)! + Int(data.bcount)! + Int(data.ccount)!)))
                    result = resultCalc(roundingCost: data.roundUnit)
                    resulttextView.text = "太っ腹部長さん\(data.acount)名は\(data.acost)円\n太っ腹課長さん\(data.bcount)名は\(data.bcost)円\n太っ腹先輩さん\(data.ccount)名は\(data.ccost)円\n一人あたりのお会計は\(result)円です\n部長,課長,先輩ご馳走様です。"
                }else if (data.acost != "" && data.bcost != "" && data.acount != "" && data.bcount != "" && data.ccost == "" && data.ccount == ""  && Int(data.member)! > (Int(data.acount)! + Int(data.bcount)!)) && Int(data.cost)! >= (Int(data.acost)! + Int(data.bcost)!) {
                    result = String((Int(data.cost)! - Int(data.acost)! * Int(data.acount)! - Int(data.bcost)! * Int(data.bcount)!) / (Int(data.member)! - Int(data.acount)! - Int(data.bcount)!))
                    result = resultCalc(roundingCost: data.roundUnit)
                    resulttextView.text = "太っ腹部長さん\(data.acount)名は\(data.acost)円\n太っ腹課長さん\(data.bcount)名は\(data.bcost)円\n一人あたりのお会計は\(result)円です\n部長,課長ご馳走様です。"
                }else if (data.bcost != "" && data.ccost != "" && data.bcount != "" && data.ccount != "" && data.acost == "" && data.acount == "" && Int(data.member)! > (Int(data.bcount)! + Int(data.ccount)!) && Int(data.cost)! >= (Int(data.bcost)! + Int(data.ccost)!)) {
                    result = String((Int(data.cost)! - Int(data.bcost)! * Int(data.bcount)! - Int(data.ccost)! * Int(data.ccount)!) / (Int(data.member)! - Int(data.bcount)! - Int(data.ccount)!))
                    result = resultCalc(roundingCost: data.roundUnit)
                    resulttextView.text = "太っ腹課長さん\(data.bcount)名は\(data.bcost)円\n太っ腹先輩さん\(data.ccount)名は\(data.ccost)円\n一人あたりのお会計は\(result)円です\n課長,先輩ご馳走様です。"
                }else if (data.acost != "" && data.ccost != "" && data.acount != "" && data.ccount != "" && data.bcost == "" && data.bcount == "" && Int(data.member)! > (Int(data.acount)! + Int(data.ccount)!) && Int(data.cost)! >= (Int(data.acost)! + Int(data.ccost)!)) {
                    result = String((Int(data.cost)! - Int(data.acost)! * Int(data.acount)! - Int(data.ccost)! * Int(data.ccount)!) / (Int(data.member)! - Int(data.acount)! - Int(data.ccount)!))
                    result = resultCalc(roundingCost: data.roundUnit)
                    resulttextView.text = "太っ腹部長さん\(data.acount)名は\(data.acost)円\n太っ腹先輩さん\(data.ccount)名は\(data.ccost)円\n一人あたりのお会計は\(result)円です\n部長,先輩ご馳走様です。"
                }else if data.acost != "" && data.acount != "" && data.bcost == "" && data.ccost == "" && data.bcount == "" && data.ccount == "" && Int(data.member)! > Int(data.acount)! && Int(data.cost)! >= Int(data.acost)! {
                    result = String((Int(data.cost)! - Int(data.acost)! * Int(data.acount)!) / (Int(data.member)! - Int(data.acount)!))
                    result = resultCalc(roundingCost: data.roundUnit)
                    resulttextView.text = "太っ腹部長さん\(data.acount)名は\(data.acost)円\n一人あたりのお会計は\(result)円です\n部長ご馳走様です。"
                }else if data.bcost != "" && data.bcount != "" && data.acost == "" && data.ccost == "" && data.acount == "" && data.ccount == "" && Int(data.member)! >  Int(data.bcount)! && Int(data.cost)! >= Int(data.bcost)!{
                    result = String((Int(data.cost)! - Int(data.bcost)! * Int(data.bcount)!) / (Int(data.member)! - Int(data.bcount)!))
                    result = resultCalc(roundingCost: data.roundUnit)
                    resulttextView.text = "太っ腹課長さん\(data.bcount)名は\(data.bcost)円\n一人あたりのお会計は\(result)円です\n課長ご馳走様です。"
                    
                }else if data.ccost != "" && data.ccount != "" && data.acost == "" && data.bcost == "" && data.acount == "" && data.bcount == "" && Int(data.member)! > Int(data.ccount)! && Int(data.cost)! >= Int(data.ccost)! {
                    result = String((Int(data.cost)! - Int(data.ccost)! * Int(data.ccount)!) / (Int(data.member)! - Int(data.ccount)!))
                    result = resultCalc(roundingCost: data.roundUnit)
                    resulttextView.text = "太っ腹先輩さん\(data.ccount)名は\(data.ccost)円\n一人あたりのお会計は\(result)円です\n先輩ご馳走様です。"
                    
                }else if data.acost == "" && data.acount == "" && data.bcost == "" && data.bcount == "" && data.ccost == "" && data.ccount == ""{
                    result = String(Int(data.cost)! / (Int(data.member)!))
                    result = resultCalc(roundingCost: data.roundUnit)
                    resulttextView.text = "一人あたりのお会計は\(result)円です"
                }else{
                    resulttextView.text = "Error!入力を確認してください。"
                }
            }else{
                resulttextView.text = "Error!お会計，総人数を入力してください。"
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
        //事前精算の場合
        case 0:
            switch data.roundUnit{
            case .yen1:
                resultOutput()
            case .yen10:
                resultOutput()
            case .yen100:
                resultOutput()
            case .yen500:
                resultOutput()
            }
        
        //事後精算の場合
        case 1:

            if data.errorFlag != 1{
                switch data.roundUnit{
                //1円単位での精算の場合
                case .yen1:
                    postResult(round: 1)
                //10円単位での精算の場合
                case .yen10:
                    postResult(round: 10)
                //100円単位での精算の場合
                case .yen100:
                    postResult(round: 100)
                //500円単位での精算の場合
                case .yen500:
                    postResult(round: 500)
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
    
    //丸め単位に応じた結果計算関数
    func resultConv(res:Int) -> String{
        switch data.roundUnit {
        case .yen1:
            result = String(format:"%g",(ceil((Double(res) / 1)) * 1))
        case .yen10:
            result = String(format:"%g",(ceil((Double(res) / 10)) * 10))
        case .yen100:
            result = String(format:"%g",(ceil((Double(res) / 100)) * 100))
        case .yen500:
            result = String(format:"%g",(ceil((Double(res) / 500)) * 500))
        }
        return result
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
