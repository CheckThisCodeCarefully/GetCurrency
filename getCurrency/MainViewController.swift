//
//  MainViewController.swift
//  getCurrency
//
//  Created by Gazolla on 08/01/16.
//  Copyright © 2016 Gazolla. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    lazy var getCurrencyButton:UIButton = {
        return UIButton.makeButton("get currency", tag: 222, hasBackground: true, target: self,  action: #selector(MainViewController.btnTapped(_:)))
    }()
    
    lazy var textView:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var currencyCtrl:CurrencyController = {
        return CurrencyController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MainViewController.selectedCurrency(_:)), name: "selectedCurrency", object: nil)
         
        self.view.addSubview(self.getCurrencyButton)
        self.view.addConstraints(getCurrencyButton.constrainToTopOfSuperView(200))
        self.view.addConstraints(getCurrencyButton.centerHorizontallyTo(self.view))
        self.view.addConstraints(getCurrencyButton.constrainWidth(200))
        self.view.addConstraints(getCurrencyButton.constrainHeight(50))
        
        
        self.view.addSubview(textView)
        self.view.addConstraints(textView.constrainToBottomOfSuperView(100))
        self.view.addConstraints(textView.centerHorizontallyTo(self.view))
        self.view.addConstraints(textView.constrainWidth(self.view.bounds.width-20))
        self.view.addConstraints(textView.constrainHeight(200))
     }
    
    func selectedCurrency(notification:NSNotification){
        self.textView.text = ""
        let currency = notification.object as! Currency
        print("\(currency.print())")
        self.textView.text = "\(currency.print())"
    }
    
    func btnTapped(sender:UIButton){
        let navCtrl = UINavigationController(rootViewController: self.currencyCtrl)
        self.navigationController!.presentViewController(navCtrl, animated: true) {}
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
