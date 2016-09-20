//
//  TTS.swift
//  Where-am-i
//
//  Created by 임성훈 on 2016. 9. 19..
//  Copyright © 2016년 임성훈. All rights reserved.
//

import Foundation
import AVFoundation

struct TTSModule{
    static func speak(text : String) -> Void{
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: text) // 텍스트 여기에
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.4 // 속도
        synthesizer.speak(utterance)
    }
}
