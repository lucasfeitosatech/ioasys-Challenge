//
//  CustomButton.swift
//  Desafio ioasys
//
//  Created by Lucas Feitosa on 21/10/20.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initButton()
    }
    
    override class func prepareForInterfaceBuilder() {
        //super.init()
        //initButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    private func initButton() {
        self.backgroundColor = Color.BUTTON_COLOR
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.cornerRadius = 10
    }

}
