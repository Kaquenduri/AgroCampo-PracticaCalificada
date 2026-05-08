//
//  AppearanceManager.swift
//  AgroCampo
//
//  Created by Marco Chunga 5F 20261 on 08/05/26.
//

// Helpers/AppearanceManager.swift
import UIKit

struct AppearanceManager {
    static func aplicar() {
        let verdeAgro = UIColor(red: 0.18, green: 0.72, blue: 0.35, alpha: 1.0)
        
        // TabBar
        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()
        tabAppearance.backgroundColor = .systemBackground
        tabAppearance.stackedLayoutAppearance.selected.iconColor = verdeAgro
        tabAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: verdeAgro
        ]
        UITabBar.appearance().standardAppearance = tabAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabAppearance
        
        // NavigationBar — large titles
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backgroundColor = .systemBackground
        navAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().tintColor = verdeAgro
    }
}
