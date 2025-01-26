//
//  PopUpView.swift
//  Scrumdinger
//
//  Created by Smruti Bachhav on 25/01/25.
//

import SwiftUI

struct PopUpView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Text("Meeting will finish in a while! ")
                    .font(.headline)
                Text("Go Back or click \'Dismiss\' to end the meeting.")
                    .font(.caption)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(18)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}


struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
