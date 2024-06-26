//
//  EntitlementManager.swift
//  ATipJar
//
//  Created by avalan.zhang on 6/26/24.
//

import SwiftUI

class EntitlementManager: ObservableObject {
    static let userDefaults = UserDefaults(suiteName: "group.demo.app")!
    
    @AppStorage("hasPro", store: userDefaults)
    var hasPro: Bool = false
}
