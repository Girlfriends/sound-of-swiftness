//
//  NotePlayer.swift
//  NotesPlease
//
//  Created by Sam Tarakajian on 7/8/16.
//  Copyright © 2016 Girlfriends Labs. All rights reserved.
//

import Foundation
import AudioKit

class NotePlayer {
    
    class SineVoice {
        var freq: Double
        let tone: AKOperation
        let env: AKOperation
        let gen: AKOperationGenerator
        
        init() {
            freq = 440
            tone = AKOperation.sineWave(frequency: AKOperation.parameters(0))
            env = tone.triggeredWithEnvelope(AKOperation.trigger, attack: 0.02, hold: 0.75, release: 0.20)
            gen = AKOperationGenerator(operation: env)
        }
    }
    
    var notes: [SineVoice]
    let mixer: AKMixer
    
    init(vcount:NSInteger) {
        mixer = AKMixer()
        notes = [SineVoice]()
        for i in 0..<vcount {
            notes.append(SineVoice())
            mixer.connect(notes[i].gen)
        }
    }
    
    func start() {
        for v in notes {
            v.gen.start()
        }
        mixer.start()
    }
    
    func triggerNote(pitch: NSInteger, vindex: NSInteger) {
        notes[vindex].gen.trigger([pitch.midiNoteToFrequency()])
    }
}