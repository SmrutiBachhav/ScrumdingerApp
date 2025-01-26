//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Smruti Bachhav on 02/01/25.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 4 ))
            .foregroundColor(theme.accentColor)
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: Theme.buttercup)
    }
}
