//
//  Loader.swift
//  Desafio ioasys
//
//  Created by Lucas Feitosa on 21/10/20.
//

import Foundation

import UIKit

class Loader: UIView {
    
    var isShowing:Bool = false
    var spinner:UIActivityIndicatorView!
    
    let label:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 20)
        l.lineBreakMode = NSLineBreakMode.byWordWrapping
        l.numberOfLines = 0
        l.textAlignment = .left
        l.text = "Estamos buscando seus dados"
        l.textColor = UIColor.white
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("has not been implemented")
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
    }
    
    func dismiss() {
        isShowing = false
        UIView.animate(withDuration: 0.2, animations: {
            self.removeFromSuperview()
            
        })
    }
    
    func show(controller:UIViewController) {
        isShowing = true
        if #available(iOS 13.0, *) {
            spinner = UIActivityIndicatorView(style: .large)
        } else {
            spinner = UIActivityIndicatorView(style: .whiteLarge)
        }
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.frame = UIScreen.main.bounds
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        spinner.color = UIColor.white
        self.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(label)
        label.topAnchor.constraint(equalTo: spinner.bottomAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        controller.view.addSubview(self)
    }
    
}
