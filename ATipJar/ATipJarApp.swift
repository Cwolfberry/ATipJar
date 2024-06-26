//
//  ATipJarApp.swift
//  ATipJar
//
//  Created by avalan.zhang on 6/24/24.
//

import SwiftUI

@main
struct ATipJarApp: App {
    
    @StateObject private var store = TipsStore()
    
    @StateObject private var entitlementManager: EntitlementManager
    @StateObject private var subscriptionsManager: SubscriptionsManager
    
    init() {
        let entitlementManager = EntitlementManager()
        let subscriptionsManager = SubscriptionsManager(entitlementManager: entitlementManager)
        self._entitlementManager = StateObject(wrappedValue: entitlementManager)
        self._subscriptionsManager = StateObject(wrappedValue: subscriptionsManager)
    }
    
    var body: some Scene {
        WindowGroup {
            // InApp Purchase
//            ContentView()
//                .environmentObject(store)
            
            // Subscription
            SubscriptionView()
                .environmentObject(entitlementManager)
                .environmentObject(subscriptionsManager)
                .task {
                    await subscriptionsManager.updatePurchasedProducts()
                }
        }
    }
}
