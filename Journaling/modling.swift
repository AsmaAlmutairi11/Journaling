//
//  modling.swift
//  Journaling
//
//  Created by Asma Mohammed on 26/04/1446 AH.
//

import SwiftUI


struct modling: Identifiable {
    let id: UUID = .init()
    var title: String = ""
     var text: String = ""
     var date = Date()
     var isBookmarked: Bool = false
}

