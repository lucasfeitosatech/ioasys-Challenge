//
//  CustomTextField.swift
//  Desafio ioasys
//
//  Created by Lucas Feitosa on 21/10/20.
//

import Foundation
import UIKit

class CustomTextField:UIView {
    
    
    @IBOutlet weak var image: UIButton!
    @IBOutlet var view: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var textFieldContainer: UIView!
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    

    private func initView() {
        //self.translatesAutoresizingMaskIntoConstraints = false
        
        if let view = Bundle.main.loadNibNamed("CustomTextField", owner: self, options: nil)?.first as? UIView {
            self.addSubview(view)
            self.translatesAutoresizingMaskIntoConstraints = false
            view.translatesAutoresizingMaskIntoConstraints = false
            
            view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
        self.textFieldContainer.layer.cornerRadius = 10
        self.errorLabel.isHidden = true
        self.label.textColor = Color.TEXT_COLOR
        self.textField.textColor = Color.TEXT_COLOR
        
    }
    
    public func setupWithError(message:String){
        self.errorLabel.text = message
        self.errorLabel.isHidden = false
        self.textFieldContainer.layer.borderWidth = 1
        self.textFieldContainer.layer.borderColor = Color.ERROR_COLOR.cgColor
    }
    
}
