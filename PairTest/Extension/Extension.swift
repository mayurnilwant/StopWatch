//
//  Extension.swift
//  PairTest
//
//  Created by Mayur Nilwant on 01/09/2022.
//

import Foundation

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}
