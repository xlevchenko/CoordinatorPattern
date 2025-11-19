//
//  ModelLayer.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 19.11.2025.
//

import Foundation

class ModelLayer {
    
    let systemLayer: SystemLayer
    
    
    init(systemLayer: SystemLayer) {
        self.systemLayer = systemLayer
    }
    
}

extension ModelLayer {
    
    func logout() {
        systemLayer.logout()
    }
}
