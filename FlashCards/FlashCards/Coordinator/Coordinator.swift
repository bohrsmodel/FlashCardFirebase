//
//  Coordinator.swift
//  FlashCards
//
//  Created by Daniel Brannon on 11/13/21.
//

import UIKit

class Coordinator {
    var navCon: UINavigationController?
}

extension Coordinator: ViewControllerDelegate {
    func goToCardVC() {
        let vc = UIStoryboard(name: "Cards", bundle: nil).instantiateViewController(identifier: "cardsVC") as! cardsVC
        navCon?.pushViewController(vc, animated: true)
    }
    
    func goToAccountVC() {
        let vc = UIStoryboard(name: "Account", bundle: nil).instantiateViewController(identifier: "accountVC") as! accountVC
        navCon?.pushViewController(vc, animated: true)
    }
    
    func goToCreateVC() {
        let vc = UIStoryboard(name: "Create", bundle: nil).instantiateViewController(identifier: "createVC") as! createVC
        navCon?.pushViewController(vc, animated: true)
    }
    
    func goToLoginVC() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        navCon?.pushViewController(vc, animated: true)
    }
    
}
