//
//  SystemLayer.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 19.11.2025.
//

import Foundation

class SystemLayer {
    
    let userDefaults: UserDefaultsManager
    
    init(userDefaults: UserDefaultsManager) {
        self.userDefaults = userDefaults
    }
}

extension SystemLayer {
     
    func logout() {
        userDefaults.clearAllUserDefaults()
    }
}
