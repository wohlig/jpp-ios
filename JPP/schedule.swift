//
//  schedule.swift
//  JPP
//
//  Created by Chintan Shah on 25/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

@IBDesignable class schedule: UIView {

    @IBOutlet weak var trapLabel: UILabel!
    @IBOutlet weak var team1Image: UIImageView!
    @IBOutlet weak var team1Score: UILabel!
    @IBOutlet weak var team2Image: UIImageView!
    @IBOutlet weak var team2Score: UILabel!
    @IBOutlet weak var matchTime: UILabel!
    @IBOutlet weak var matchStadium: UILabel!
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var addToCalendar: UIButton!
    @IBOutlet weak var bookTickets: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
        
    }
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "schedule", bundle: bundle)
        let sortnewview = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        sortnewview.frame = bounds
        sortnewview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(sortnewview);
    }
    
}
