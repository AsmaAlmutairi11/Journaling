//
//  sheet.swift
//  Journaling
//
//  Created by Asma Mohammed on 19/04/1446 AH.
//

import SwiftUI

struct Sheet1: View {
    @StateObject var asma = ViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    var existingJournal: modling? // The journal to edit if available

    @State private var title: String = ""
    @State private var text: String = ""
    
    var body: some View {
        ZStack{
            Color(.background)
            NavigationStack {
                VStack {
                    TextField("Title", text: $asma.title, axis: .vertical)
                        .font(.system(size: 34, weight: .bold))
                        .frame(width: 358.96, height: 41, alignment: .leading)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    
                    Text(DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none))
                        .foregroundColor(.gray)
                        .font(.system(size: 16) .weight(.regular))
                        .frame(width: 87.4, height: 19, alignment: .leading)
                        .padding(.trailing, 273)
                    
                    TextField("Type your Journal...", text: $asma.newJournaltext, axis: .vertical)
                        .font(.system(size: 20))
                        .frame(width: 380, height: 400, alignment: .top)
                        .padding(.top, 20)
                        .padding(.trailing, 10)
                        .padding(.bottom, 170)
                        .padding(.leading,28)
                }
                
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("cancel"){
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("save"){
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
    Sheet1()
}

