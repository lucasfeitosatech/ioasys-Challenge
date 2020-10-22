//
//  Helper.swift
//  Desafio ioasys
//
//  Created by Lucas Feitosa on 21/10/20.
//

import Foundation

import Foundation
import SystemConfiguration

struct Helper{
    // foi feito antes do Leonardo chegar e não quis alterar ate que o refactory do layout seja feito devido ao retrabalho que eu teria que fazer
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isValidPassword(_ password:String) -> Bool {
        if(password.count < 4) {
            return false
        } else {
            return true
        }
    }
}
