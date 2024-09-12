//
//  Item.swift
//  SwiftUI-Cookbook
//  
//  Created by t-watanabe on 2024/09/12.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
