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
    var pay1: String = ""
    var pay2: String = ""
    var pay3: String = ""
    
    @IBOutlet weak var resulttextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(data)
        
        switch  data.indicator {
        //前精算の場合
        //固定の計算をまだ実装できていません。
        case 0:
            switch data.roundingCost{
            case 1:
                if data.cost != "" || data.member != ""{
                    result = String((Int(data.cost)! / Int(data.member)!))
                    resulttextView.text = "一人あたりのお会計は\(result)円です"
                }else{
                    resulttextView.text = "Error！入力がありませんでした。"
                }
            case 10:
                if data.cost != "" || data.member != ""{
                    result = String(format:"%g",(ceil((Double(data.cost)! / Double(data.member)!) / 10) * 10))
                    resulttextView.text = "一人あたりのお会計は\(result)円です"
                }else{
                    resulttextView.text = "Error！入力がありませんでした。"
                }
            case 100:
                if data.cost != "" || data.member != ""{
                    result = String(format:"%g",(ceil((Double(data.cost)! / Double(data.member)!) / 100) * 100))
                    resulttextView.text = "一人あたりのお会計は\(result)円です"
                }else{
                    resulttextView.text = "Error！入力がありませんでした。"
                }
            case 1000:
                if data.cost != "" || data.member != ""{
                    result = String(format:"%g",(ceil((Double(data.cost)! / Double(data.member)!) / 1000) * 1000))
                    resulttextView.text = "一人あたりのお会計は\(result)円です"
                }else{
                    resulttextView.text = "Error！入力がありませんでした。"
                }
            default:
                break
            }
            
        //後精算の場合
        case 1:
            
            switch data.roundingCost{
            //1円単位での精算の場合
            case 1:
                if data.cost != "" || data.member != ""{
                    
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
                    
                    switch data.paymember {
                    //立て替えした人数が3人の場合
                    case 3:
                        if data.apayFlag == 1 && data.bpayFlag == 1{
                            pay1 = String(format:"%g",(ceil(Double((cdifference - (adifference + bdifference)) / (Int(data.member)! - data.paymember)))))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から \(data.cname) に\(adifference)円 \n \(data.bname) から \(data.cname) に\(bdifference)円 \n その他メンバは \(pay1)円"
                        }else if data.bpayFlag == 1 && data.cpayFlag == 1{
                            pay1 = String(format:"%g",(ceil(Double((adifference - (bdifference + cdifference)) / (Int(data.member)! - data.paymember)))))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.bname) から \(data.aname) に\(bdifference)円 \n \(data.cname)  から \(data.aname) に\(cdifference)円 \n その他メンバは \(pay1)円"
                        }else if data.cpayFlag == 1 && data.apayFlag == 1{
                            pay1 = String(format:"%g",(ceil(Double((bdifference - (adifference + cdifference)) / (Int(data.member)! - data.paymember)))))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.cname)  から \(data.bname) に\(cdifference)円 \n \(data.aname) から \(data.bname)  に\(adifference)円 \n その他メンバは \(pay1)円"
                        }else if data.apayFlag == 1 {
                            pay1 = String(format:"%g",(ceil(Double((bdifference - (adifference / 2)) / (Int(data.member)! - data.paymember)))))
                            pay2 = String(format:"%g",(ceil(Double( (cdifference - (adifference / 2)) / (Int(data.member)! - data.paymember)))))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から \(data.bname)  に\(adifference / 2)円 \n \(data.aname)から \(data.cname)  に\(adifference / 2)円 \n その他メンバは \n \(data.bname) に\(pay1) \n \(data.cname) に\(pay2)円"
                        }else if data.bpayFlag == 1 {
                            pay1 = String(format:"%g",(ceil(Double((adifference - (bdifference / 2)) / (Int(data.member)! - data.paymember)))))
                            pay2 = String(format:"%g",(ceil(Double((cdifference - (bdifference / 2)) / (Int(data.member)! - data.paymember)))))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n B から \(data.aname) に\(adifference / 2)円 \n \(data.bname) から \(data.cname)  に\(bdifference / 2)円 \n その他メンバは \n\(data.aname) に\(pay1) \n \(data.cname) に\(pay2)円"
                        }else if data.cpayFlag == 1 {
                            pay1 = String(format:"%g",(ceil(Double((adifference - (cdifference / 2)) / (Int(data.member)! - data.paymember) ))))
                            pay2 = String(format:"%g",(ceil(Double((bdifference - (cdifference / 2)) / (Int(data.member)! - data.paymember)))))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.cname)  から \(data.aname) に\(cdifference / 2)円 \n \(data.cname)  から \(data.bname)  に\(cdifference / 2)円 \n その他メンバは \n\(data.aname)に\(pay1) \n \(data.bname)に\(pay2)円"
                        }else{
                            pay1 = String(format:"%g",(ceil(Double( adifference  / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                            pay2 = String(format:"%g",(ceil(Double( bdifference  / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                            pay3 = String(format:"%g",(ceil(Double( cdifference  / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n その他メンバは \n\(data.aname) に\(pay1)円 \n \(data.bname)  に\(pay2)円 \n \(data.cname) に\(pay3)円払いましょう"
                        }
                        
                    //立て替えした人数が2人の場合
                    case 2:
                        if data.apayFlag == 1 {
                            pay1 = String(format:"%g",(ceil(Double((bdifference - adifference) / (Int(data.member)! - data.paymember)))))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から B に\(adifference)円 \n その他メンバは \(data.bname) に\(pay1)円払いましょう"
                        }else if data.bpayFlag == 1{
                            pay1 = String(format:"%g",(ceil(Double((adifference - bdifference) / (Int(data.member)! - data.paymember)))))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.bname) から \(data.aname) に\(bdifference)円 \n その他メンバは Aに\(pay1)円払いましょう"
                        }else{
                            pay1 = String(format:"%g",(ceil(Double(adifference / (Int(data.member)! - data.paymember)))))
                            pay2 = String(format:"%g",(ceil(Double(bdifference / (Int(data.member)! - data.paymember)))))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n その他メンバは \n\(data.aname)に\(pay1)円 Bに\(pay2)円払いましょう"
                        }
                    //立て替えした人数が1人の場合
                    case 1:
                        pay1 = String(format:"%g",(ceil(Double( Int(data.cost)! / (Int(data.member)!)))))
                        resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname)に\(pay1)円払いましょう"
                    default: break
                    }
                }else{
                    resulttextView.text = "Error！入力がありませんでした。"
                }
                //10円単位での精算の場合
                case 10:
                    if data.cost != "" || data.member != ""{
                        
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
                        result = String(format:"%g",(ceil((Double(data.cost)! / Double(data.member)!) / 10) * 10))
                        
                        switch data.paymember {
                        //立て替えした人数が3人の場合
                        case 3:
                            if data.apayFlag == 1 && data.bpayFlag == 1{
                                result = String(format:"%g",(ceil((Double(data.cost)! / Double(data.member)!) / 10) * 10))
                                
                                pay1 = String(format:"%g",(ceil(Double( (cdifference - (adifference + bdifference)) / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から \(data.cname) に\(adifference)円 \n \(data.bname) から \(data.cname) に\(bdifference)円 \n その他メンバは \(pay1)円"
                            }else if data.bpayFlag == 1 && data.cpayFlag == 1{
                                pay1 = String(format:"%g",(ceil(Double((adifference - (bdifference + cdifference)) / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.bname) から \(data.aname) に\(bdifference)円 \n \(data.cname)  から \(data.aname) に\(cdifference)円 \n その他メンバは \(pay1)円"
                            }else if data.cpayFlag == 1 && data.apayFlag == 1{
                                pay1 = String(format:"%g",(ceil(Double( (bdifference - (adifference + cdifference)) / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.cname)  から \(data.bname) に\(cdifference)円 \n \(data.aname) から \(data.bname)  に\(adifference)円 \n その他メンバは \(pay1)円"
                            }else if data.apayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double( (bdifference - (adifference / 2)) / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                pay2 = String(format:"%g",(ceil(Double( (cdifference - (adifference / 2)) / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から \(data.bname)  に\(adifference / 2)円 \n \(data.aname)から \(data.cname)  に\(adifference / 2)円 \n その他メンバは \n \(data.bname) に\(pay1) \n \(data.cname) に\(pay2)円"
                            }else if data.bpayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double((adifference - (bdifference / 2)) / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                pay2 = String(format:"%g",(ceil(Double((cdifference - (bdifference / 2)) / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n B から \(data.aname) に\(adifference / 2)円 \n \(data.bname) から \(data.cname)  に\(bdifference / 2)円 \n その他メンバは \n\(data.aname) に\(pay1) \n \(data.cname) に\(pay2)円"
                            }else if data.cpayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double((adifference - (cdifference / 2)) / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                pay2 = String(format:"%g",(ceil(Double((bdifference - (cdifference / 2)) / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.cname)  から \(data.aname) に\(cdifference / 2)円 \n \(data.cname)  から \(data.bname)  に\(cdifference / 2)円 \n その他メンバは \n\(data.aname)に\(pay1) \n \(data.bname)に\(pay2)円"
                            }else{
                                pay1 = String(format:"%g",(ceil(Double(adifference  / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                pay2 = String(format:"%g",(ceil(Double(bdifference  / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                pay3 = String(format:"%g",(ceil(Double(cdifference  / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n その他メンバは \n\(data.aname) に\(pay1)円 \n \(data.bname)  に\(pay2)円 \n \(data.cname) に\(pay3)円払いましょう"
                            }
                            
                        //立て替えした人数が2人の場合
                        case 2:
                            if data.apayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double((bdifference - adifference) / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から B に\(adifference)円 \n その他メンバは \(data.bname) に\(pay1)円払いましょう"
                            }else if data.bpayFlag == 1{
                                pay1 = String(format:"%g",(ceil(Double(adifference - bdifference / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.bname) から \(data.aname) に\(bdifference)円 \n その他メンバは Aに\(pay1)円払いましょう"
                            }else{
                                pay1 = String(format:"%g",(ceil(Double(adifference / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                pay2 = String(format:"%g",(ceil(Double(bdifference / (Int(data.member)! - data.paymember)) / 10 ) * 10))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n その他メンバは \n\(data.aname)に\(pay1)円 Bに\(pay2)円払いましょう"
                            }
                        //立て替えした人数が1人の場合
                        case 1:
                            pay1 = String(format:"%g",(ceil(Double(Int(data.cost)! / (Int(data.member)!)) / 10 ) * 10))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname)に\(pay1)円払いましょう"
                        default: break
                        }
                    }else{
                        resulttextView.text = "Error！入力がありませんでした。"
                }

                //100円単位での精算の場合
                case 100:
                    if data.cost != "" || data.member != ""{
                        
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
                        result = String(format:"%g",(ceil((Double(data.cost)! / Double(data.member)!) / 100) * 100))
                        
                        switch data.paymember {
                        //立て替えした人数が3人の場合
                        case 3:
                            if data.apayFlag == 1 && data.bpayFlag == 1{
                                
                                
                                pay1 = String(format:"%g",(ceil(Double((cdifference - (adifference + bdifference)) / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から \(data.cname) に\(adifference)円 \n \(data.bname) から \(data.cname) に\(bdifference)円 \n その他メンバは \(pay1)円"
                            }else if data.bpayFlag == 1 && data.cpayFlag == 1{
                                pay1 = String(format:"%g",(ceil(Double((adifference - (bdifference + cdifference)) / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.bname) から \(data.aname) に\(bdifference)円 \n \(data.cname)  から \(data.aname) に\(cdifference)円 \n その他メンバは \(pay1)円"
                            }else if data.cpayFlag == 1 && data.apayFlag == 1{
                                pay1 = String(format:"%g",(ceil(Double((bdifference - (adifference + cdifference)) / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.cname)  から \(data.bname) に\(cdifference)円 \n \(data.aname) から \(data.bname)  に\(adifference)円 \n その他メンバは \(pay1)円"
                            }else if data.apayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double((bdifference - (adifference / 2)) / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                pay2 = String(format:"%g",(ceil(Double((cdifference - (adifference / 2)) / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から \(data.bname)  に\(adifference / 2)円 \n \(data.aname)から \(data.cname)  に\(adifference / 2)円 \n その他メンバは \n \(data.bname) に\(pay1) \n \(data.cname) に\(pay2)円"
                            }else if data.bpayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double((adifference - (bdifference / 2)) / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                pay2 = String(format:"%g",(ceil(Double((cdifference - (bdifference / 2)) / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n B から \(data.aname) に\(adifference / 2)円 \n \(data.bname) から \(data.cname)  に\(bdifference / 2)円 \n その他メンバは \n\(data.aname) に\(pay1) \n \(data.cname) に\(pay2)円"
                            }else if data.cpayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double((adifference - (cdifference / 2)) / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                pay2 = String(format:"%g",(ceil(Double((bdifference - (cdifference / 2)) / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.cname)  から \(data.aname) に\(cdifference / 2)円 \n \(data.cname)  から \(data.bname)  に\(cdifference / 2)円 \n その他メンバは \n\(data.aname)に\(pay1) \n \(data.bname)に\(pay2)円"
                            }else{
                                pay1 = String(format:"%g",(ceil(Double(adifference  / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                pay2 = String(format:"%g",(ceil(Double(bdifference  / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                pay3 = String(format:"%g",(ceil(Double(cdifference  / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n その他メンバは \n\(data.aname) に\(pay1)円 \n \(data.bname)  に\(pay2)円 \n \(data.cname) に\(pay3)円払いましょう"
                            }
                            
                        //立て替えした人数が2人の場合
                        case 2:
                            if data.apayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double((bdifference - adifference) / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から B に\(adifference)円 \n その他メンバは \(data.bname) に\(pay1)円払いましょう"
                            }else if data.bpayFlag == 1{
                                pay1 = String(format:"%g",(ceil(Double((adifference - bdifference) / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.bname) から \(data.aname) に\(bdifference)円 \n その他メンバは Aに\(pay1)円払いましょう"
                            }else{
                                pay1 = String(format:"%g",(ceil(Double(adifference / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                pay2 = String(format:"%g",(ceil(Double(bdifference / (Int(data.member)! - data.paymember)) / 100 ) * 100))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n その他メンバは \n\(data.aname)に\(pay1)円 Bに\(pay2)円払いましょう"
                            }
                        //立て替えした人数が1人の場合
                        case 1:
                            pay1 = String(format:"%g",(ceil(Double(Int(data.cost)! / (Int(data.member)!)) / 100 ) * 100))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname)に\(pay1)円払いましょう"
                        default: break
                        }
                    }else{
                        resulttextView.text = "Error！入力がありませんでした。"
                }

                //1000円単位での精算の場合
                case 1000:
                    if data.cost != "" || data.member != ""{
                        
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
                        result = String(format:"%g",(ceil((Double(data.cost)! / Double(data.member)!) / 1000) * 1000))
                        
                        switch data.paymember {
                        //立て替えした人数が3人の場合
                        case 3:
                            if data.apayFlag == 1 && data.bpayFlag == 1{
                                
                                
                                pay1 = String(format:"%g",(ceil(Double((cdifference - (adifference + bdifference)) / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から \(data.cname) に\(adifference)円 \n \(data.bname) から \(data.cname) に\(bdifference)円 \n その他メンバは \(pay1)円"
                            }else if data.bpayFlag == 1 && data.cpayFlag == 1{
                                pay1 = String(format:"%g",(ceil(Double((adifference - (bdifference + cdifference)) / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.bname) から \(data.aname) に\(bdifference)円 \n \(data.cname)  から \(data.aname) に\(cdifference)円 \n その他メンバは \(pay1)円"
                            }else if data.cpayFlag == 1 && data.apayFlag == 1{
                                pay1 = String(format:"%g",(ceil(Double(bdifference - (adifference + cdifference) / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.cname)  から \(data.bname) に\(cdifference)円 \n \(data.aname) から \(data.bname)  に\(adifference)円 \n その他メンバは \(pay1)円"
                            }else if data.apayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double((bdifference - (adifference / 2)) / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                pay2 = String(format:"%g",(ceil(Double((cdifference - (adifference / 2)) / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から \(data.bname)  に\(adifference / 2)円 \n \(data.aname)から \(data.cname)  に\(adifference / 2)円 \n その他メンバは \n \(data.bname) に\(pay1) \n \(data.cname) に\(pay2)円"
                            }else if data.bpayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double((adifference - (bdifference / 2)) / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                pay2 = String(format:"%g",(ceil(Double((cdifference - (bdifference / 2)) / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n B から \(data.aname) に\(adifference / 2)円 \n \(data.bname) から \(data.cname)  に\(bdifference / 2)円 \n その他メンバは \n\(data.aname) に\(pay1) \n \(data.cname) に\(pay2)円"
                            }else if data.cpayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double((adifference - (cdifference / 2)) / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                pay2 = String(format:"%g",(ceil(Double((bdifference - (cdifference / 2)) / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.cname)  から \(data.aname) に\(cdifference / 2)円 \n \(data.cname)  から \(data.bname)  に\(cdifference / 2)円 \n その他メンバは \n\(data.aname)に\(pay1) \n \(data.bname)に\(pay2)円"
                            }else{
                                pay1 = String(format:"%g",(ceil(Double(adifference  / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                pay2 = String(format:"%g",(ceil(Double(bdifference  / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                pay3 = String(format:"%g",(ceil(Double(cdifference  / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n その他メンバは \n\(data.aname) に\(pay1)円 \n \(data.bname)  に\(pay2)円 \n \(data.cname) に\(pay3)円払いましょう"
                            }
                            
                        //立て替えした人数が2人の場合
                        case 2:
                            if data.apayFlag == 1 {
                                pay1 = String(format:"%g",(ceil(Double((bdifference - adifference) / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname) から B に\(adifference)円 \n その他メンバは \(data.bname) に\(pay1)円払いましょう"
                            }else if data.bpayFlag == 1{
                                pay1 = String(format:"%g",(ceil(Double((adifference - bdifference) / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.bname) から \(data.aname) に\(bdifference)円 \n その他メンバは Aに\(pay1)円払いましょう"
                            }else{
                                pay1 = String(format:"%g",(ceil(Double(adifference / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                pay2 = String(format:"%g",(ceil(Double(bdifference / (Int(data.member)! - data.paymember)) / 1000 ) * 1000))
                                resulttextView.text = "一人あたりのお会計は\(result)円です \n その他メンバは \n\(data.aname)に\(pay1)円 Bに\(pay2)円払いましょう"
                            }
                        //立て替えした人数が1人の場合
                        case 1:
                            pay1 = String(format:"%g",(ceil(Double(Int(data.cost)! / (Int(data.member)!)) / 1000 ) * 1000))
                            resulttextView.text = "一人あたりのお会計は\(result)円です \n \(data.aname)に\(pay1)円払いましょう"
                        default: break
                        }
                    }else{
                        resulttextView.text = "Error！入力がありませんでした。"
                }

                default:
                    break
                }
            default: break
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
