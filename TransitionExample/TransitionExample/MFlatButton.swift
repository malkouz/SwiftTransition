//
//  MFlatButton.swift
//  SalesV2
//
//  Created by Moayad Al kouz on 11/1/16.
//  Copyright © 2016 Moayad Al kouz. All rights reserved.
//

import UIKit
@IBDesignable
class MFlatButton: UIButton {

    @IBInspectable var borderColor:UIColor = UIColor.lightGray
    @IBInspectable var cornerRadius:CGFloat = 5.0
    @IBInspectable var borderWidth:CGFloat = 0.5
    @IBInspectable var enapleImageInsets:Bool = true
    @IBInspectable var imageInsets:CGFloat = 0.0
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setup()
//        //fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func awakeFromNib() {
//        setup()
//        super.awakeFromNib()
//    }
    
    private func setup(){
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.borderWidth = self.borderWidth
        //let myInsets : UIEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        //self.image = self.image?.resizableImage(withCapInsets: myInsets)
        if(enapleImageInsets){
            self.imageEdgeInsets = UIEdgeInsets(top: self.imageInsets, left: self.imageInsets, bottom: self.imageInsets, right: self.imageInsets)
        }
        self.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    
}
