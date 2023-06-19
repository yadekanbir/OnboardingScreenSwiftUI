//
//  OnboardingScreenSwiftUIApp.swift
//  OnboardingScreenSwiftUI
//
//  Created by Yade KANBİR on 19.06.2023.
//

import SwiftUI

@main
struct OnboardingScreenSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
