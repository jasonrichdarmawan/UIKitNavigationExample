//
//  Feature_1_A_ViewModel.swift
//  UIKitNavigationExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/07/23.
//

import Foundation

final class Feature_1_A_ViewModel: ObservableObject {
    var id: UUID
    
    @Published var currentStation: Station?
    
    init(id: UUID = UUID(), currentStation: Station? = nil) {
        self.id = id
        self.currentStation = currentStation
        print("\(type(of: self)) \(#function) \(id.uuidString)")
    }
    
    deinit { print("\(type(of: self)) \(#function) \(id.uuidString)") }
}
