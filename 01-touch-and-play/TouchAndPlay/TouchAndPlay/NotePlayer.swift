//
//  NotePlayer.swift
//  TouchAndPlay
//
//  Created by Sam Tarakajian on 7/5/16.
//  Copyright © 2016 Girlfriends Labs. All rights reserved.
//

import Foundation
import AudioKit

class NotePlayer {
    
    var oscillator = AKOscillator()
    
    init() {
        AudioKit.output = oscillator
        oscillator.amplitude = 0.2
        oscillator.stop()
        AudioKit.start()
    }
    
    func startRandomTone() {
        oscillator.frequency = random(60, 84).midiNoteToFrequency()
        oscillator.start()
    }
    
    func endRandomTone() {
        oscillator.stop()
    }
}
