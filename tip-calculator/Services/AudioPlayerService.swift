//
//  AudioPlayerService.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 22/12/2023.
//

import Foundation
import AVFoundation

protocol AudioPlayerService {
    func playSound()
}

final class DefaultAudioPlayer: AudioPlayerService {
    
    private var player: AVAudioPlayer?
    
    func playSound() {
        <#code#>
    }
    
    
}
