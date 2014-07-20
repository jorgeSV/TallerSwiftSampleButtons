//
//  ViewController.swift
//  TallerSwiftSampleButtons
//
//  Created by jorgeSV on 19/7/14.
//  Copyright (c) 2014 JorgeSV. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for(var pos = 0; pos <= 5; pos++)
        {
            var button = UIButton()
            button = self.createButton(button, position: pos)
            self.view.addSubview(button)
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createButton(var button: UIButton, position: Int) -> UIButton
    {
        button = UIButton(frame: CGRectMake(20 + 100 * CGFloat(position % 3), position <= 2 ? 50 : self.view.frame.height - 65, 80, 35))
        
        button.setTitle("Button 0\(position + 1)", forState:UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState:.Normal)
        button.titleLabel.font = UIFont.systemFontOfSize(13)
        button.titleLabel.lineBreakMode = .ByTruncatingTail
        button.showsTouchWhenHighlighted = true
        button.layer.backgroundColor = UIColor.blackColor().CGColor
        button.layer.cornerRadius = 3.0
        button.addTarget(self, action:Selector("fTouchUpInside:"), forControlEvents:.TouchUpInside)
        
        return button
    }
    
    func fTouchUpInside(sender: UIButton)
    {
        var alert01 = UIAlertView(title: "Touch en: " + sender.titleLabel.text, message: "", delegate: self, cancelButtonTitle: "OK")
        alert01.show()
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int)
    {
        NSLog("Touch en Botón \(alertView.buttonTitleAtIndex(buttonIndex)) de AlertView")
    }
}

