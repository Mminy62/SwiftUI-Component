//
//  SpeechRecognizer.swift
//  STTProject
//
//  Created by 이민영 on 12/17/24.
//

import Foundation
import Speech

class SpeechRecognizer: NSObject, ObservableObject, SFSpeechRecognizerDelegate {
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))!
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    @Published var transcript = ""
    private var isTranscribing = false // 음성인식중인지 확인하는 변수
    
    override init() {
        super.init()
        self.speechRecognizer.delegate = self
    }
    
    func startTranscribing() {
        // 기존 음성인식 중인지 판별
        guard !isTranscribing else { return }
        
        isTranscribing = true
        
        // 오디오 엔진 실행중이면, 중지하고 모든 tap 제거
        if audioEngine.isRunning {
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
        }
        
        // 기존 실행된 음성 인식 작업인, recognitionTask가 없다면 해당 작업 취소
        // recognitionTask - 하나의 인식 개체 단위
        recognitionTask?.cancel()
        recognitionTask = nil
        
        // 오디오 세션 설정 및 활성화
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("오디오 세션 설정 실패: \(error)")
            isTranscribing = false
            return
        }
        
        // 음성 인식 요청 생성
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else {
            isTranscribing = false
            return
        }
        
        // 부분적 결과 보고 설정
        recognitionRequest.shouldReportPartialResults = true
        
        // 음성 인식 작업 설정
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { [weak self] result, error in
            guard let strongSelf = self else { return }
            
            var isFinal = false
            
            if let result = result {
                DispatchQueue.main.async {
                    strongSelf.transcript = result.bestTranscription.formattedString
                }
                isFinal = result.isFinal
            }
            
            if error != nil || isFinal {
                strongSelf.cleanup()
            }
        }
        
        // 오디오 엔진에 tap추가
        let recordingFormat = audioEngine.inputNode.outputFormat(forBus: 0)
        // 오디오 입력
        audioEngine.inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            
            recognitionRequest.append(buffer)
        }
        
        // 오디오 엔진 시작
        do {
            try audioEngine.start()
        } catch {
            print("오디오 엔진 시작 실패: \(error)")
            cleanup()
        }
        
    }
    
    func stopTranscribing() {
        // 음성인식 종료!
        recognitionTask?.cancel()
        cleanup()
    }
    
    private func cleanup() {
        // 설정 초기화!
        if audioEngine.isRunning {
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
        }
        recognitionRequest?.endAudio()
        recognitionRequest = nil
        recognitionTask = nil
        isTranscribing = false // 인식 중 상태 해제
    }
}
