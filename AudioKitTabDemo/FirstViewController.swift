//
//  FirstViewController.swift
//  AudioKitTabDemo
//
//  Created by Mike Spears on 2016-11-23.
//  Copyright © 2016 MADLab. All rights reserved.
//

import UIKit
import AudioKit

class FirstViewController: UIViewController {

    var oscillator = AKOscillator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AudioKit.output = oscillator
        AudioKit.start()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func playTone(_ sender: UIButton) {
        if oscillator.isPlaying {
            oscillator.stop()
            sender.setTitle("Play Tone", for: .normal)
        } else {
            oscillator.frequency = random(220, 800)
            oscillator.amplitude = random(0.5, 1)
            oscillator.start()
            sender.setTitle("Stop playing tone at \(Int(oscillator.frequency))Hz", for: .normal)
        }
    }

}

