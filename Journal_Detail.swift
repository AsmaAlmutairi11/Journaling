//
//  Journal_Detail.swift
//  Journaling
//
//  Created by Asma Mohammed on 08/06/1446 AH.
//

import SwiftUI

extension DateFormatter {
    static let short: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
}

struct Journal_Detail: View {
    @Binding var entry: modling
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TextField("Title", text: $entry.title)
                    .font(.title)
                    .padding()

                Text("\(entry.date, formatter: DateFormatter.short)")
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                TextEditor(text: $entry.text)
                    .padding()
                    .frame(maxHeight: 300)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)

                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // إجراء الحفظ
                        dismiss()
                    }
                    .bold()
                }
            }
            .navigationTitle("Edit Journal")
        }
    }
}


