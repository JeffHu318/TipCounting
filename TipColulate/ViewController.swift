//
//  ViewController.swift
//  TipColulate
//
//  Created by WEI on 7/3/16.
//  Copyright © 2016 WEI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PriceDollar: UITextField!
    @IBOutlet weak var PriceCent: UITextField!
    @IBOutlet weak var CurrentTip: UILabel!
    @IBOutlet weak var Tippersentage: UISlider!
        
    @IBOutlet weak var FinalPrice: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //give the init value
        CurrentTip.text = "\(lroundf(Tippersentage.value))%"
        ConculateFinalPrice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func TipPersenChange(_ sender: AnyObject) {
        
        
        CurrentTip.text = "\(lroundf(Tippersentage.value))%"        
        ConculateFinalPrice()
    }
    
    @IBAction func DollorChange(_ sender: AnyObject) {
        ConculateFinalPrice()
    }
    
    @IBAction func CentChange(_ sender: AnyObject) {
        ConculateFinalPrice()
    }
    
    func ConculateFinalPrice() {
        
        var tempPrice = ""
        if PriceDollar.text != nil {
            
            tempPrice = PriceDollar.text! + "."
        }
        else{
            tempPrice = "00."
        }
        
        if PriceCent.text != nil {
            tempPrice += PriceCent.text!
        }
        else{
            tempPrice += "00"
        }
        
        let PayPrice = Double(tempPrice)
        
        if PayPrice != 0 && PayPrice != nil {
            
            let price = PayPrice! * (Double(lroundf(Tippersentage.value)) + 100 ) / 100
            
            
            FinalPrice.text = String(format: "%.2f Dollors", price)
            //FinalPrice.text = FinalPrice.text + " Dollors"
            
        }
        else {
            FinalPrice.text = "No Price Inserted !!!"
        }
    }
}

