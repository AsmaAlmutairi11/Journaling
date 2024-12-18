//
//  sheet.swift
//  Journaling
//
//  Created by Asma Mohammed on 19/04/1446 AH.
//

import SwiftUI
struct Sheet: View {
    @ObservedObject var asma: ViewModel
    @Environment(\.dismiss) var dismiss
    var existingJournal: modling? // The journal to edit if available
    
    @State private var title: String = ""
    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            Color(.background).ignoresSafeArea()
            NavigationStack {
                VStack {
                    TextField("Title", text: $title)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    Text(DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none))
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .padding(.bottom, 10)
                        
                    
                    
                    TextField("Type your Journal...", text: $text, axis: .vertical)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    Spacer()
                }
                .padding()
                .onAppear {
                    // When sheet appears, populate fields if existing journal exists
                    if let journal = existingJournal {
                        title = journal.title
                        text = journal.text
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("Save") {
                            saveChanges()
                            dismiss()
                        }
                        .bold()
                    }
                }
                
            }
        }
    }
    
    private func saveChanges() {
        if let journalIndex = asma.journals.firstIndex(where: { $0.id == existingJournal?.id }) {
            // Update the existing journal
            asma.journals[journalIndex].title = title
            asma.journals[journalIndex].text = text
        } else {
            // Create a new journal if it doesn't exist
            let newJournal = modling(title: title, text: text, date: Date(), isBookmarked: false)
            asma.journals.append(newJournal)
        }
    }
    
}
#Preview {
    Sheet(asma: ViewModel())
}
