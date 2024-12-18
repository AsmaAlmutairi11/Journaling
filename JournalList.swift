//
//  JournalList.swift
//  Journaling
//
//  Created by Asma Mohammed on 17/06/1446 AH.
//

//
//  JournalList.swift
//  Journaling
//
//  Created by Asma Mohammed on 29/05/1446 AH.
//
import SwiftUI
struct JournalList: View {
    @StateObject var Raghad = ViewModel() // ViewModel instance for managing data
    @State private var Sheet1ispresent = false // To show the editing sheet
    @State private var selectedJournal: modling? // The selected journal for editing

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(Raghad.journals) { entry in
                        VStack(alignment: .leading){
                            
                            
                            
                            HStack {
                                Text(entry.title)
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.purple11)

                                Spacer()

                                Button(action: {
                                    if let index = Raghad.journals.firstIndex(where: { $0.id == entry.id }) {
                                        Raghad.journals[index].isBookmarked.toggle()
                                    }
                                }) {
                                    Image(systemName: entry.isBookmarked ? "bookmark.fill" : "bookmark")
                                        .font(.system(size: 24))
                                        .foregroundColor(.purple11)
                                }
                            }

                            Text("\(entry.date, formatter: Raghad.currentDate)")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.gray)

                            Text(entry.text)
                                .font(.body)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .swipeActions(edge: .leading) {
                            Button(action: {
                                selectedJournal = entry // Set the selected journal
                                Sheet1ispresent = true // Show the edit sheet
                            }) {
                                Image(systemName: "pencil")
                                Text("Edit")
                            }
                            .tint(.blue)
                        }
                        .swipeActions(edge: .trailing) { // Delete button
                            Button(role: .destructive, action: {
                                if let index = Raghad.journals.firstIndex(where: { $0.id == entry.id }) {
                                    Raghad.deleteJournal(at: index)
                                }
                            }) {
                                Image(systemName: "trash")
                                Text("Delete")
                            }
                        }
                    }
                }
                .navigationTitle("Journal") // Title for the navigation bar

                .toolbar {
                    // One toolbar for the entire navigation view
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Button(action: {
                                Raghad.showingsheet.toggle()
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(.purple11)
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $Sheet1ispresent) {
                // Display the sheet with the selected journal if available
                if let journal = selectedJournal {
                    Sheet(asma: Raghad, existingJournal: journal)
                }
            }
        }
    }
}
