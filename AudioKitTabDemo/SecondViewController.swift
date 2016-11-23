//
//  SecondViewController.swift
//  AudioKitTabDemo
//
//  Created by Mike Spears on 2016-11-23.
//  Copyright © 2016 MADLab. All rights reserved.
//

import UIKit
import AudioKit

class SecondViewController: UIViewController {

    var oscillator = AKOscillator()
    

    var currentTouch: UITouch? {
        didSet {
            if let touch = currentTouch {
                oscillator.frequency = frequencyAt(touch: touch)
                oscillator.amplitude = amplitudeAt(touch: touch)
                frequencyLabel.text = "\(Int(oscillator.frequency))Hz"
                oscillator.start()
            } else {
                oscillator.stop()
            }
        }
    }

    @IBOutlet weak var frequencyLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AudioKit.stop()
        AudioKit.output = oscillator
        AudioKit.start()
    }
    

    func frequencyAt(touch: UITouch) -> Double {
        let localLocation = touch.location(in: view)
        let f = Double(localLocation.x / view.bounds.width)
        return f * (800.0 - 220.0) + 220.0
    }
    
    func amplitudeAt(touch:UITouch) -> Double {
        let localLocation = touch.location(in: view)
        let f = Double(localLocation.y / view.bounds.height)
        return f
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentTouch = touches.first
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentTouch = touches.first
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentTouch = nil
    }

}

