//
//  Item.swift
//  TattooSpot
//
//  Created by Jakub Iwaszek on 10/10/2024.
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
