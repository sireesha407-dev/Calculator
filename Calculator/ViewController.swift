//
//  ViewController.swift
//  Calculator
//
//  Created by apple on 21/10/20.
//  Copyright © 2020 Krify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultTF: UITextField!
    
       var previousnum=""
       var numberonscreen=""
       var performingmaths=false
    var result = ""
    var operation = 0
    var prev=""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func numbersButtonClicked(_ sender: UIButton) {
        if performingmaths == true{
        resultTF.text=prev+String(sender.tag-1)
        numberonscreen = String(sender.tag-1)
        performingmaths=false
    }
    else{
    resultTF.text = resultTF.text!+String(sender.tag-1)
        numberonscreen = resultTF.text!
    }
    }
    
    @IBAction func operationsButtonClicked(_ sender: UIButton) {
    if sender.tag != 11 && sender.tag != 17 && resultTF.text != ""
        {
            previousnum=resultTF.text!
            if sender.tag == 12   //  "+"
            {
                resultTF.text = "+"
            }
            
            if sender.tag == 13   //  "-"
            {
                resultTF.text = "-"
            }
            
            if sender.tag == 14   //  "*"
            {
                resultTF.text = "*"
            }
            
            else if sender.tag == 15   //  "/"
            {
                resultTF.text = "/"
            }
            else if sender.tag == 16  //  "/"
                      {
                          resultTF.text = "%"
            }
            else if sender.tag == 18{ //"."
                previousnum = previousnum + "."
                       resultTF.text! = previousnum
                   }
            prev=resultTF.text!
        operation=sender.tag
            performingmaths=true
    }
        else if sender.tag == 11 && resultTF.text != ""{
            if operation == 12{
                resultTF.text="\(Double(previousnum)! + Double(numberonscreen)!)"
            }
            else if operation == 13{
                 resultTF.text="\(Double(previousnum)! - Double(numberonscreen)!)"
            }
            else if operation == 14{
                 resultTF.text="\(Double(previousnum)! * Double(numberonscreen)!)"
            }
            else if operation == 15{
                 resultTF.text="\(Double(previousnum)! / Double(numberonscreen)!)"
            }
        else if operation == 16{
resultTF.text="\(Double(previousnum)!.truncatingRemainder(dividingBy:Double(numberonscreen)!))"
               }
            result = resultTF.text!
       if (Double(result)!.truncatingRemainder(dividingBy:1) == 0){
            result = "\(Int(Double(result)!))"
            }
        resultTF.text=result
    }
        else if sender.tag==17
        {
            resultTF.text=""
            previousnum=""
            numberonscreen=""
            operation=0
            
        }
    }
}
