//
//  Post-settlementViewController.swift
//  SimpleCalc
//
//  Created by 藤本健悟 on 2017/01/01.
//  Copyright © 2017年 kengo. All rights reserved.
//

import UIKit
import GoogleMobileAds


class Post_settlementViewController: UIViewController,UITextViewDelegate,GADBannerViewDelegate{
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var membercountLabel: UILabel!
    @IBOutlet weak var AcostLabel: UILabel!
    @IBOutlet weak var BcostLabel: UILabel!
    @IBOutlet weak var CcostLabel: UILabel!
    @IBOutlet weak var anameLabel: UITextField!
    @IBOutlet weak var bnameLabel: UITextField!
    @IBOutlet weak var cnameLabel: UITextField!
    @IBOutlet weak var memberButton: UIButton!
    @IBOutlet weak var acostButton: UIButton!
    @IBOutlet weak var bcostButton: UIButton!
    @IBOutlet weak var ccostButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var substractButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    
    let AdMobID = "[Your AdMob ID]"
    let TEST_ID = "ca-app-pub-6765299879929157/1239189704"

    var data = CalcData()
    var tmp:String = ""
    
    //演算子の入力フラグ
    var opeFlag:Int = 0
    //演算子を保持する変数
    var ope:String = ""
    //合計を保持する変数
    var sum:Int64 = 0
    var result:String = "0"
    var label:UILabel?
    //Intの最大値，最小値を保持する関数
    var max:Int64 = Int64(Int.max)
    var min:Int64 = Int64(Int.min)
    
    //結果画面の前のページに戻るボタン用
    @IBAction func back(segue:UIStoryboardSegue){
    }
    
    //ラベルをタッチした際に枠線に色をつける関数
    func highlight(button: UIButton, label: UILabel, source: InputSource) {
        bouderClear()
        synchronize()
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 2;
        label.layer.borderColor = UIColor.red.cgColor
        inputSource = source
        opebouderClear()
        if Calculator().1.text != ""{
            sum = Int64(Calculator().1.text!)!
        }else{
            sum = 0
        }
        ope = ""
        result = ""
    }
    
    //選択した演算子の枠線に色をつける関数
    func opelight(button: UIButton) {
        opebouderClear()
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        opeFlag = 1
    }
    
    @IBAction func memberButton(_ sender: UIButton) {
        highlight(button: memberButton, label: membercountLabel, source: .member)
    }
    @IBAction func acostButton(_ sender: UIButton) {
        highlight(button: acostButton, label: AcostLabel, source: .personA)
    }
    @IBAction func bcostButton(_ sender: UIButton) {
        highlight(button: bcostButton, label: BcostLabel, source: .personB)
    }
    @IBAction func ccostButton(_ sender: UIButton) {
        highlight(button: ccostButton, label: CcostLabel, source: .personC)
    }

    @IBAction func roundingSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            data.roundUnit = .yen1
        case 1:
            data.roundUnit = .yen10
        case 2:
            data.roundUnit = .yen100
        case 3:
            data.roundUnit = .yen500
        default:break
        }
    }
    
    enum InputSource {
        case member
        case personA
        case personB
        case personC
    }
    var inputSource: InputSource = .member
    
    func buttoninput(number: String){
        switch inputSource {
        case .member:
            if data.member.characters.count < 8{
                if opeFlag == 0{
                    data.member += number
                    membercountLabel.text = data.member
                }else{
                    opeFlag = 0
                    data.member = number
                    membercountLabel.text = data.member
                }
            }
        case .personA:
            if data.acost.characters.count < 8{
                if opeFlag == 0{
                    data.acost += number
                    AcostLabel.text = data.acost
                }else{
                    opeFlag = 0
                    data.acost = number
                    AcostLabel.text = data.acost
                }
            }
        case .personB:
            if data.member != "" && data.acost != "" && data.bcost.characters.count < 8{
                if opeFlag == 0{
                    data.bcost += number
                    BcostLabel.text = data.bcost
                }else{
                    opeFlag = 0
                    data.bcost = number
                    BcostLabel.text = data.bcost
                }
            }
        case .personC:
            if data.member != "" && data.acost != "" && data.bcost != "" && data.ccost.characters.count < 8{
                if opeFlag == 0{
                    data.ccost += number
                    CcostLabel.text = data.ccost
                }else{
                    opeFlag = 0
                    data.ccost = number
                    CcostLabel.text = data.ccost
                }
            }
        }
        opeFlag = 0
    }
    
    func zeroinput(number: String){
        switch inputSource {
        case .member:
            if data.member != "" && data.member != "0" && data.member.characters.count < 8{
                data.member += number
                membercountLabel.text = data.member
            }
        case .personA:
            if data.acost != "" && data.acost != "0"  && data.acost.characters.count < 8{
                data.acost += number
                AcostLabel.text = data.acost
            }
        case .personB:
            if data.bcost != "" && data.bcost != "0"  && data.bcost.characters.count < 8{
                data.bcost += number
                BcostLabel.text = data.bcost
            }
        case .personC:
            if data.ccost != "" && data.ccost != "0"  && data.ccost.characters.count < 8{
                data.ccost += number
                CcostLabel.text = data.ccost
            }
        }
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        buttoninput(number: "1")
    }
    @IBAction func twoButton(_ sender: UIButton) {
        buttoninput(number: "2")
    }
    @IBAction func threeButton(_ sender: UIButton) {
        buttoninput(number: "3")
    }
    @IBAction func fourButton(_ sender: UIButton) {
        buttoninput(number: "4")
    }
    @IBAction func fiveButton(_ sender: UIButton) {
        buttoninput(number: "5")
    }
    @IBAction func sixButton(_ sender: UIButton) {
        buttoninput(number: "6")
    }
    @IBAction func sevenButton(_ sender: UIButton) {
        buttoninput(number: "7")
    }
    @IBAction func eightButton(_ sender: UIButton) {
        buttoninput(number: "8")
    }
    @IBAction func nineButton(_ sender: UIButton) {
        buttoninput(number: "9")
    }
    @IBAction func zeroButton(_ sender: UIButton) {
        zeroinput(number: "0")
    }
    @IBAction func zerozeroButton(_ sender: UIButton) {
        zeroinput(number: "00")
    }

    //計算関数１
    func Calculator() -> (String ,UILabel){
        switch inputSource {
        case .member:
            result = data.member
            label = membercountLabel
        case .personA:
            result = data.acost
            label = AcostLabel
        case .personB:
            result = data.bcost
            label = BcostLabel
        case .personC:
            result = data.ccost
            label = CcostLabel
        }
        return (result, label!)
    }
    
    //計算関数２
    func calc(number: String) -> String{
        if Calculator().1.text != ""{
            switch ope {
            case "+":
                sum += Int64(number)!
            case "-":
                sum -= Int64(number)!
            case "×":
                sum *= Int64(number)!
            case "":
                sum = Int64(number)!
            default: break
            }
        }
        
        if sum > max{
            sum = max
        }else if sum < min{
            sum = min
        }
        return String(sum)
    }
    
    //足し算
    @IBAction func additionButton(_ sender: UIButton) {
        if opeFlag == 0{
            Calculator().1.text = calc(number: (Calculator().0))
            ope = "+"
            opelight(button: additionButton)
        }else if opeFlag == 1{
            ope = "+"
            opelight(button: additionButton)
        }
    }

     //引き算
    @IBAction func substractButton(_ sender: UIButton) {
        if opeFlag == 0{
            Calculator().1.text = String(calc(number: (Calculator().0)))
            ope = "-"
            opelight(button: substractButton)
        }else if opeFlag == 1{
            ope = "-"
            opelight(button: substractButton)
        }
    }
   
 
    //掛け算
    @IBAction func multiplicationButton(_ sender: UIButton) {
        if opeFlag == 0{
            Calculator().1.text = String(calc(number: (Calculator().0)))
            ope = "×"
            opelight(button: multiplicationButton)
        }else if opeFlag == 1{
            ope = "×"
            opelight(button: multiplicationButton)
        }

    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        if ope != ""{
            Calculator().1.text = calc(number: (Calculator().0))
            opeFlag = 1
            opebouderClear()
        }
    }

    
    //一文字消すボタン
    @IBAction func AllClearButton(_ sender: UIButton) {

        switch inputSource {
        case .member:
            data.member = ""
            membercountLabel.text = data.member
            clear()
            result = ""
        case .personA:
            data.acost = ""
            AcostLabel.text = data.acost
            clear()
        case .personB:
            data.bcost = ""
            BcostLabel.text = data.bcost
            clear()
        case .personC:
            data.ccost = ""
            CcostLabel.text = data.ccost
            clear()
        }
    }
    
    //精算ボタン
    @IBAction func resultButton(_ sender: UIButton) {
        data.indicator = 1
        
        //支払者Aの金額と総人数を入力している場合に遷移
        if data.acost != "" && data.member != ""{
            //支払者Aにしか入力がない場合
            if data.bcost == "" && data.ccost == "" {
                //Aの名前をdata.anameに格納
                if anameLabel.text != ""{
                    data.aname = anameLabel.text!
                }else{
                    data.aname = "A"
                }
                //お会計の総額を算出
                data.cost = data.acost
                print(data)
                //一人当たりの支払金額を算出
                if membercountLabel.text != "0"{
                    data.percost = (Int(data.cost)! / Int(data.member)!)
                }else{
                    data.errorFlag = 1
                }
                
                //立て替えした人数を代入
                data.paymember = 1
                //支払者AとBに入力がある場合
            }else if data.member != "" && data.acost != "" && data.bcost != "" && data.ccost == ""{
                //AとBの名前をdata.nameに格納
                if anameLabel.text != ""{
                    data.aname = anameLabel.text!
                }else{
                    data.aname = "A"
                }
                if bnameLabel.text != ""{
                    data.bname = bnameLabel.text!
                }else{
                    data.bname = "B"
                }
                //お会計の総額を算出
                data.cost = String(Int(data.acost)! + Int(data.bcost)!)
                //一人当たりの支払金額を算出
                if membercountLabel.text != "0"{
                data.percost = (Int(data.cost)! / Int(data.member)!)
                }else{
                    data.errorFlag = 1
                }
                
                //立て替えした人数を代入
                data.paymember = 2
                
                //支払金額が一人当たりの支払金額以下だった場合，その人の支払フラグを立てる
                if Int(data.acost)! < data.percost {
                    data.apayFlag = 1
                }
                if Int(data.bcost)! < data.percost{
                    data.bpayFlag = 1
                }
                //支払者AとBとCに入力がある場合
            }else if data.member != "" && data.acost != "" && data.bcost != "" && data.ccost != ""{
                //AとBとCの名前をdata.nameに格納
                if anameLabel.text != ""{
                    data.aname = anameLabel.text!
                }else{
                    data.aname = "A"
                }
                if bnameLabel.text != ""{
                    data.bname = bnameLabel.text!
                }else{
                    data.bname = "B"
                }
                if cnameLabel.text != ""{
                    data.cname = cnameLabel.text!
                }else{
                    data.cname = "C"
                }
                //お会計の総額を算出
                data.cost = String(Int(data.acost)! + Int(data.bcost)! + Int(data.ccost)!)
                //一人当たりの支払金額を算出
                if membercountLabel.text != "0"{
                    data.percost = (Int(data.cost)! / Int(data.member)!)
                }else{
                    data.errorFlag = 1
                }
                //立て替えした人数を代入
                data.paymember = 3
                //支払金額が一人当たりの支払金額以下だった場合，その人の支払フラグを立てる
                if Int(data.acost)! < data.percost {
                    data.apayFlag = 1
                }
                if Int(data.bcost)! < data.percost{
                    data.bpayFlag = 1
                }
                if Int(data.ccost)! < data.percost{
                    data.cpayFlag = 1
                }
            }else{
                data.errorFlag = 1
            }
            //支払者Aに入力がない時の処理
        }else{
            data.errorFlag = 1
        }
        performSegue(withIdentifier: "PushResult", sender: resultButton)
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //罫線をデフォルト値に戻す関数
    func bouderClear() -> (){
        memberButton.layer.borderWidth = 1;
        acostButton.layer.borderWidth = 1;
        bcostButton.layer.borderWidth = 1;
        ccostButton.layer.borderWidth = 1;
        membercountLabel.layer.borderWidth = 1;
        AcostLabel.layer.borderWidth = 1;
        BcostLabel.layer.borderWidth = 1;
        CcostLabel.layer.borderWidth = 1;
        memberButton.layer.borderColor = UIColor.black.cgColor
        acostButton.layer.borderColor = UIColor.black.cgColor
        bcostButton.layer.borderColor = UIColor.black.cgColor
        ccostButton.layer.borderColor = UIColor.black.cgColor
        membercountLabel.layer.borderColor = UIColor.black.cgColor
        AcostLabel.layer.borderColor = UIColor.black.cgColor
        BcostLabel.layer.borderColor = UIColor.black.cgColor
        CcostLabel.layer.borderColor = UIColor.black.cgColor
    }
    
    //ラベルとstruckの値を同期する関数
    func synchronize() -> (){
        data.member = membercountLabel.text!
        data.acost = AcostLabel.text!
        data.bcost = BcostLabel.text!
        data.ccost = CcostLabel.text!

    }
    
    //演算子の枠線の色を元に戻す関数
    func opebouderClear() -> (){
        additionButton.layer.borderWidth = 0.5
        additionButton.layer.borderColor = UIColor.black.cgColor
        substractButton.layer.borderWidth = 0.5
        substractButton.layer.borderColor = UIColor.black.cgColor
        multiplicationButton.layer.borderWidth = 0.5
        multiplicationButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func clear() -> (){
        opebouderClear()
        ope = ""
        opeFlag = 0
        sum = 0
        result = ""
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        
        if let destinationViewController = segue.destination as?
            ResultViewController {
            destinationViewController.data = data
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        membercountLabel.isUserInteractionEnabled = true
        AcostLabel.isUserInteractionEnabled = true
        BcostLabel.isUserInteractionEnabled = true
        CcostLabel.isUserInteractionEnabled = true
        
        // AdMob広告設定
        var bannerView: GADBannerView = GADBannerView()
        bannerView = GADBannerView(adSize:kGADAdSizeBanner)
        bannerView.frame.origin = CGPoint(x:0, y:(self.view.frame.size.height - bannerView.frame.height))
        bannerView.frame.size = CGSize(width:self.view.frame.width,height:bannerView.frame.height)
        // AdMobで発行された広告ユニットIDを設定
        bannerView.adUnitID = "ca-app-pub-6765299879929157/1239189704"
        //bannerView.adUnitID = "ca-app-pub-6765299879929157/3366659597"
        bannerView.delegate = self
        bannerView.rootViewController = self
        let gadRequest:GADRequest = GADRequest()
        // テスト用の広告を表示する時のみ使用（申請時に削除）
        gadRequest.testDevices = [kGADSimulatorID]
        bannerView.load(gadRequest)
        self.view.addSubview(bannerView)
        
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
    
    //ラベルにタッチした際、枠線の色を変更
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            switch tag {
            case 1:
                highlight(button: memberButton, label: membercountLabel, source: .member)
            case 2:
                highlight(button: acostButton, label: AcostLabel, source: .personA)
            case 3:
                highlight(button: bcostButton, label: BcostLabel, source: .personB)
            case 4:
                highlight(button: ccostButton, label: CcostLabel, source: .personC)
            default:
                break
            }
            if (self.anameLabel.isFirstResponder) {
                self.anameLabel.resignFirstResponder()
            }
            if (self.bnameLabel.isFirstResponder) {
                self.bnameLabel.resignFirstResponder()
            }
            if (self.cnameLabel.isFirstResponder) {
                self.cnameLabel.resignFirstResponder()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
