//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Smruti Bachhav on 06/01/25.
//

import SwiftUI

struct MeetingFooterView: View {
//    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    //for popup view that display time is up for the meeting
    @State var showAlert = false
    //determines speaker number
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil}
        return index+1
    }
    //determnine whether active speaker is last speaker
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted}
    }
    //returns information about active speaker and pass it to the textview The property returns Speaker X of Y when there are remaining speakers or No more speakers when the meeting exceeds the allotted time.
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack{
                if  isLastSpeaker {
                    Text("Last Speaker")
//                        .onAppear{
//
                            if scrumTimer.secondsElapsed == scrumTimer.lengthInMinutes * 60{
                            ////                        NavigationLink("End Scrum", destination:  DetailView(scrum: $scrum))
                                                    PopUpView()
//                                showAlert = true
//                            }
                        }
//

                } else{
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction){
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
//        .alert("Meeting Time Finished!", isPresented: $showAlert) {
//            Button("OK", role: .cancel) {}
//        } message: {
//            Text("Please click OK to end the meeting.")
//        }
    }
}

struct MeetingfooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(/*scrum: .constant(DailyScrum.sampleData[0]),*/ speakers: DailyScrum.sampleData[0].attendees.speakers,skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
