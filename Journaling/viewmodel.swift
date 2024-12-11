//
//  viewmodel.swift
//  Journaling
//
//  Created by Asma Mohammed on 26/04/1446 AH.
//


import SwiftUI

class ViewModel: ObservableObject {
    @Published var journals: [modling] = []
    @Published var showingsheet = false
    @Published var isActive = true
    @Published var search: String = ""
    @Published var selectedjournals: Journal?
    @Environment(\.dismiss) var dismiss
    @Published var title: String = ""
    @Published var newJournaltext: String = ""
    @State var BookmarkFiliter : Bool = false
    @Published var dateFilter: Bool = false

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
        BookmarkFiliter.toggle()
        applyFilters()
    }
    
    func date() {
        dateFilter.toggle()
        applyFilters()
    }
    
    func saveJournal() {
        let newJournal = modling(title: title, text: newJournaltext, date: .now, isBookmarked: false)
        journals.append(newJournal)
        title = ""
        newJournaltext = ""
        applyFilters()
    }
    
    private func applyFilters() {
        if BookmarkFiliter {
            journals = journals.filter { $0.isBookmarked }
        }

        if dateFilter {
            journals.sort { $0.date > $1.date }
        }
    }
}
