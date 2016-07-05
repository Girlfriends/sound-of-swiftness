//
//  ViewController.swift
//  TouchAndPlay
//
//  Created by Sam Tarakajian on 7/5/16.
//  Copyright © 2016 Girlfriends Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let notePlayer = NotePlayer();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        notePlayer.startRandomTone()
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        notePlayer.endRandomTone()
    }
}

