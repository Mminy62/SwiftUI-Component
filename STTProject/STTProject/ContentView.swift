//
//  ContentView.swift
//  STTProject
//
//  Created by 이민영 on 12/17/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var speechRecognizer = SpeechRecognizer()

    var body: some View {
        VStack {
            Text("Speech To Text")
                .font(.title)
                .padding()
            
            TextEditor(text: $speechRecognizer.transcript)
            
            HStack {
                Button(action: {
                    speechRecognizer.startTranscribing()
                }, label: {
                    Text("Start")
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                })
                
                Button(action: {
                    speechRecognizer.stopTranscribing()
                }, label: {
                    Text("Stop")
                        .padding()
                        .background(Color.red)
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                })
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
