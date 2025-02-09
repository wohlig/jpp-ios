//
//  FanCornerController.swift
//  JPP
//
//  Created by Chintan Shah on 08/02/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

var fanControllerGlobal:FanCornerController!

class FanCornerController: UIViewController {
    var verticalLayout : VerticalLayout!
    @IBOutlet var scrollView: UIScrollView!
    //@IBOutlet var submitButton: UIButton!
    
    var fan: fanCorner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fanControllerGlobal = self;
        self.setNavigationBarItemText("FAN CORNER")
        
        self.verticalLayout = VerticalLayout(width: self.view.frame.width);
        self.scrollView.insertSubview(self.verticalLayout, at: 0)
        //var height:CGFloat = 525
        var height:CGFloat = 930
        print(self.view.frame.height);
        if(self.view.frame.height > height)
        {
            height = self.scrollView.frame.height + 20
        }
        
        fan = fanCorner(frame: CGRect(x: 8,y: 8,width: self.verticalLayout.frame.width-16,height: height));
        self.verticalLayout.addSubview(fan);
        
        //submitButton.addTarget(self, action: "submitFormButton:", forControlEvents: .TouchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(FanCornerController.tapOutsideKeyboardClose(_:)))
        view.addGestureRecognizer(tapGesture)
        fan.facbook.addTarget(self, action: #selector(self.facebook(_:)), for: .touchUpInside)
        fan.twitter.addTarget(self, action: #selector(self.twitter(_:)), for: .touchUpInside)
        fan.instagram.addTarget(self, action: #selector(self.instagram(_:)), for: .touchUpInside)
        resizeView(8)
    }
    
    
    func facebook(_ sender: UIButton){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let WebController = self.storyboard?.instantiateViewController(withIdentifier: "facebook") as! FacebookController
        self.navigationController?.pushViewController(WebController, animated: true)
        let theUrl = URL(string: "https://www.facebook.com/JaipurPinkPanthers/")
        WebController.url = theUrl
    }
    
    func twitter(_ sender: UIButton){
        let WebController = self.storyboard?.instantiateViewController(withIdentifier: "facebook") as! FacebookController
        self.navigationController?.pushViewController(WebController, animated: true)
        let theUrl = URL(string: "https://twitter.com/JaipurPanthers")
        WebController.url = theUrl
    }
    
    
    func instagram(_ sender: UIButton){
        let WebController = self.storyboard?.instantiateViewController(withIdentifier: "facebook") as! FacebookController
        self.navigationController?.pushViewController(WebController, animated: true)
        let theUrl = URL(string: "https://www.instagram.com/jaipur_pinkpanthers/")
        WebController.url = theUrl
    }
    
    func tapOutsideKeyboardClose(_ gesture: UITapGestureRecognizer) {
        fan.firstName.resignFirstResponder()
        fan.lastName.resignFirstResponder()
        fan.mobile.resignFirstResponder()
        fan.email.resignFirstResponder()
        fan.city.resignFirstResponder()
    }
    
    func submitFormButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Thank You", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func resizeView(_ offset:CGFloat)
    {
        self.verticalLayout.layoutSubviews()
        self.scrollView.contentSize = CGSize(width: self.verticalLayout.frame.width, height: self.verticalLayout.frame.height + offset)
    }
    
}
