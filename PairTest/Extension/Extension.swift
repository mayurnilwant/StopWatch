//
//  Extension.swift
//  PairTest
//
//  Created by Mayur Nilwant on 01/09/2022.
//

import Foundation

extension Bundle {
    var displayName: String? {
                
        if let infoPlistPath = Bundle.main.url(forResource: "Info", withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                    return dict["CFBundleName"] as? String
                }
            } catch {
                print(error)
                return ""
                
            }
        }
        return ""
    }
}
