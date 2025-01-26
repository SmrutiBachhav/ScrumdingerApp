//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Smruti Bachhav on 11/01/25.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let isRecording: Bool
    let theme: Theme
    
    //Computed property that returns the name of the current speaker
//    A computed property in Swift is a property that doesn't directly store a value. Instead, it calculates a value each time it's accessed or updated. Computed properties are defined using a combination of getter and optionally a setter.
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted})?.name ?? "Someone"
    }
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: {$0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                            .stroke(theme.mainColor, lineWidth: 12)
//                            .stroke(
//                                LinearGradient(colors: [.mainColor,.accentColor], startPoint: .top, endPoint: .bottom),
//                                lineWidth: 12)
                    }
                }
            }
            .padding(.horizontal)
        
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Bill", isCompleted: true),ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
    }
    
    static var previews: some View {
        MeetingTimerView(speakers: speakers, isRecording: true, theme: .yellow)
    }
}
