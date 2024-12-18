//
//  viewmodel.swift
//  Journaling
//
//  Created by Asma Mohammed on 26/04/1446 AH.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var journals: [modling] = []
    @Published var showingsheet = false
    @Published var isActive = true
    @Published var search: String = ""
    @Published var title: String = ""
    @Published var newJournalText: String = ""
    @Published var selectedJournals: modling?

    // Filter flags
    @Published var bookmarkFilter: Bool = false
    @Published var dateFilter: Bool = false

    // Formatter
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
        bookmarkFilter.toggle()
        applyFilters()
    }

    func date() {
        dateFilter.toggle()
        applyFilters()
    }

    func saveJournal() {
        let newJournal = modling(title: title, text: newJournalText, date: .now, isBookmarked: false)
        journals.append(newJournal)
        title = ""
        newJournalText = ""
        applyFilters()
    }

    private func applyFilters() {
        if bookmarkFilter {
            journals = journals.filter { $0.isBookmarked }
        }

        if dateFilter {
            journals.sort { $0.date > $1.date }
        }
    }
}
