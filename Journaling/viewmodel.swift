//
//  viewmodel.swift
//  Journaling
//
//  Created by Asma Mohammed on 26/04/1446 AH.
//


import SwiftUI

class viewmodel: ObservableObject {
    @Published var journals: [modling] = []
    @Published var showingsheet = false
    @Published var isActive = true
    @Published var search: String = ""
    @Published var selectedjournals: Journal?
    @Environment(\.dismiss) var dismiss
    @Published var title: String = ""
    @Published var newJournaltext: String = ""
    @State var BookmarkFiliter = false

    let currentDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    func deleteJournal(at index: Int) {
        journals.remove(at: index)
    }
    
    func bookmark() {
        self.BookmarkFiliter = true
        print("Bookmark action")
    }
    
    func date() {
        
        print("Date action")
    }
    
    func saveJournal() {
        let newJournal = modling(title: title,
                                 text: newJournaltext,
                                 date: .now,
                                 isBookmarked: false)
        journals.append(newJournal)
    }
}
