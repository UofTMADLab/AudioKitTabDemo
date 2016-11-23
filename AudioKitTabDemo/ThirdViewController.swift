//
//  ThirdViewController.swift
//  AudioKitTabDemo
//
//  Created by Mike Spears on 2016-11-23.
//  Copyright © 2016 MADLab. All rights reserved.
//

import UIKit
import AudioKit

class ThirdViewController: UIViewController, AKKeyboardDelegate {

    @IBOutlet weak var stackView: UIStackView!
    var oscillator = AKOscillatorBank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let adsrView = AKADSRView()
        stackView.addArrangedSubview(adsrView)
        let keyboardView = AKKeyboardView()
        stackView.addArrangedSubview(keyboardView)
        
        keyboardView.delegate = self
        keyboardView.isMultipleTouchEnabled = true
        
        adsrView.callback =  { att, dec, sus, rel in
            self.oscillator.attackDuration = att
            self.oscillator.decayDuration = dec
            self.oscillator.sustainLevel = sus
            self.oscillator.releaseDuration = rel
        }

        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AudioKit.stop()
        AudioKit.output = oscillator
        AudioKit.start()
    }
    
    func noteOn(note: MIDINoteNumber) {
        oscillator.play(noteNumber: note, velocity: 80)
    }
    
    func noteOff(note: MIDINoteNumber) {
        oscillator.stop(noteNumber: note)
    }
    

}
