//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
    // MARK: - Property
    
    var player: AVAudioPlayer!
    
    // MARK: - Function
    
    /// Play Xylophone sound when push on button
    private func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()            
    }
    
    // MARK: - IBAction
    
    @IBAction func keyPressed(_ sender: UIButton) {
        guard let buttonTittle = sender.currentTitle else {
            return
        }
        playSound(soundName: buttonTittle)
        // alpha Animation when push button
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    }
    
}

