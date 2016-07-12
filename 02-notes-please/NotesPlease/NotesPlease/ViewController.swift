//
//  ViewController.swift
//  NotesPlease
//
//  Created by Sam Tarakajian on 7/8/16.
//  Copyright © 2016 Girlfriends Labs. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {
    
    let voiceCount: NSInteger = 8
    var notePlayer: NotePlayer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notePlayer = NotePlayer(vcount: voiceCount)
        AudioKit.output = self.notePlayer!.mixer
        notePlayer!.start()
        AudioKit.start()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for t in touches {
            let location = t.locationInView(self.view)
            let nlocation = location.x / self.view.frame.size.width
            let voice = NSInteger(nlocation * CGFloat(voiceCount))
            let mnote = voice + 48
            self.notePlayer?.triggerNote(mnote, vindex: voice)
        }
    }
}

