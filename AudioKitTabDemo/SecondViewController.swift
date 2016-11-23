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
        if let touch = touches.first {
            oscillator.frequency = frequencyAt(touch: touch)
            oscillator.amplitude = amplitudeAt(touch: touch)
            oscillator.start()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            oscillator.frequency = frequencyAt(touch: touch)
            oscillator.amplitude = amplitudeAt(touch: touch)
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        oscillator.stop()
    }

}

