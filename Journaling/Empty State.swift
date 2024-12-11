//
//  Empty State.swift
//  Journaling
//
//  Created by Asma Mohammed on 19/04/1446 AH.
//

import SwiftUI

struct Empty_State: View {
    @StateObject var Raghad = ViewModel() // استخدام ViewModel
    @State private var isEditing = false // لتفعيل نافذة التعديل
    @State private var Sheet1ispresent = false // متغير لتفعيل شاشة التعديل
    @State private var selectedJournal: modling? // الجورنال المحدد للتعديل

    var body: some View {
        NavigationView {
            if Raghad.isActive {
                ZStack {
                    LinearGradient(gradient: .init(colors: [.back, .background]), startPoint: .center, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    ContentView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                withAnimation {
                                    self.Raghad.isActive = false
                                }
                            }
                        }
                }
            } else if Raghad.journals.isEmpty {
                VStack {
                    Image("Book")
                        .padding(.bottom, 29.3)
                        .frame(width: 77.7, height: 101)

                    Text("Begin Your Journal")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.purple11)
                        .padding(.bottom, 16)
                        .frame(width: 210, height: 29)

                    Text("Craft your personal diary, tap the plus icon to begin")
                        .foregroundColor(Color.white)
                        .frame(width: 282, height: 53)
                        .multilineTextAlignment(.center)
                        .tracking(0.6)
                }
                .navigationTitle("Journal")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Menu {
                            Button("Bookmark", action: Raghad.bookmark)
                                .foregroundColor(.purple11)
                            Button("Journal date", action: Raghad.date)
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease")
                                .foregroundColor(.purple11)
                        }

                        Button(action: {
                            Raghad.showingsheet.toggle()
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.purple11)
                        }
                        .sheet(isPresented: $Raghad.showingsheet) {
                            Sheet1(asma: Raghad)
                        }
                    }
                }

            } else {
                List {
                    ForEach(Raghad.journals) { entry in
                        VStack(alignment: .leading) {
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
                                selectedJournal = entry
                                Sheet1ispresent = true
                            }) {
                                Image(systemName: "pencil")
                                Text("Edit")
                            }
                            .tint(.blue)
                        }
                        .swipeActions(edge: .trailing) {
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
                .navigationTitle("Journal")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Menu {
                            Button("Bookmark", action: Raghad.bookmark)
                                .foregroundColor(.purple11)
                            Button("Journal date", action: Raghad.date)
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease")
                                .foregroundColor(.purple11)
                        }

                        Button(action: {
                            Raghad.showingsheet.toggle()
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.purple11)
                        }
                        .sheet(isPresented: $Raghad.showingsheet) {
                            Sheet1(asma: Raghad)
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    Empty_State(Raghad: ViewModel())
}
