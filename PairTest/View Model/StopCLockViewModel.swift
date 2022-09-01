//
//  StopCLockViewModel.swift
//  PairTest
//
//  Created by Mayur Nilwant on 01/09/2022.
//

import Foundation
import Metal


enum WatchStatus  {
    
    case running
    case stopped
    
   mutating func toggle () {
        
        switch self {
        case .running:
            self = .stopped
        case .stopped:
            self = .running
        }
    }
}


class StopWatchVM {
    
    var callBack: (String) -> Void
    
    var callButtonTitle: ((String) -> Void)?
    var currentStatus: String = ""
    var stopWatchTimer : Timer?
    var stoWatchStatus : WatchStatus = .stopped
    
    var intervalCountFromStart : Int = 0
    init(withCallback _callback: @escaping (String) -> Void) {
        self.callBack = _callback
        
    }
    
    func toggle() {
        
        if self.stoWatchStatus == .stopped {
            self.start()
            self.callButtonTitle!("Stop")
        }else {
            
            self.stop()
            self.callButtonTitle!("Start")

        }
        self.stoWatchStatus.toggle()
    }
    
    func stop() {
        
        self.intervalCountFromStart = 0
        self.stopWatchTimer?.invalidate()
        self.callButtonTitle!("Start")
        self.callBack("00:00:00")

    }
    
    func start () {
        
         self.intervalCountFromStart = 0
        self.stopWatchTimer?.invalidate()
        self.stopWatchTimer = Timer.scheduledTimer(timeInterval: 1/100, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        self.stopWatchTimer?.fire()
        
    }
    @objc func update() {
        
        self.intervalCountFromStart += 1
        let hhVal = self.intervalCountFromStart%100
        let ssVal = (self.intervalCountFromStart/100)%60
        let mmVal = (self.intervalCountFromStart/100)/60
        let resultString = "\(mmVal) : \(ssVal) : \(hhVal)"
        self.callBack(resultString)
        
        
    }
    
}
