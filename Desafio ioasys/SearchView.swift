//
//  SearchView.swift
//  Desafio ioasys
//
//  Created by Lucas Feitosa on 22/10/20.
//

import UIKit


@IBDesignable
class SearchView: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        //self.translatesAutoresizingMaskIntoConstraints = false
        setupContainer()
        
    }
    
    func setupContainer() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = Color.TEXT_COLOR.cgColor
    }
}
