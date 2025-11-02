//
//  UIViewController + Ext.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import UIKit

extension UIViewController {
    
    func setCustomBackButton(target: Any?, selector: Selector) {
        navigationItem.hidesBackButton = true
        navigationItem.setHidesBackButton(true, animated: false)
        
        let backImage = UIImage(systemName: "chevron.left")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: target, action: selector)
        navigationItem.leftBarButtonItem = backButton
    }
    
    func setNavigationExitButton(target: Any?, selector: Selector) {
        let closeIcon = UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let closeButton = UIBarButtonItem(image: closeIcon, style: .plain, target: target, action: selector)
        
        navigationItem.rightBarButtonItem = closeButton
    }
}
