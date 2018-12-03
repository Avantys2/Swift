//
//  ViewController.swift
//  FileOperations
//
//  Created by Viktor Siedov on 12/2/18.
//  Copyright © 2018 Viktor Siedov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var lblWait: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    private var randomTimerInterval: RandomTimerInterval?
    private var operationsCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoadThreads()
    }
    
    func startLoadThreads() {
        
        let files = FilesStore()
        
        let removeCompletion: RemoveCompletion = { _ in
            //print("removeCompletion count \(files.count) ")
            self.operationsCount -= 1
            DispatchQueue.main.async {
                self.label.text = "files:" + String(files.count)
            }
        }
        
        let appendCompletion: AppendCompletion = { _ in
           // print("appendCompletion count \(files.count)")
            DispatchQueue.main.async {
                self.lblWait.text = " wait:\(String(self.operationsCount - files.count))"
            }
        }
        
        let appendProgress:AppendProgress = { _ in
            DispatchQueue.main.async {
                self.label.text = "files:" + String(files.count)
            }
//            print("appendCompletion count \(files.count)")
            files.removeFirst(completion: removeCompletion)
        }
        
        randomTimerInterval = RandomTimerInterval(block: { _ in
            self.operationsCount += 1
            files.append(index: 0, progress: appendProgress, completion: appendCompletion)
            DispatchQueue.main.async {
                self.lblWait.text = " wait:\(String(self.operationsCount - files.count))"
            }
        })
        
        randomTimerInterval?.start()
    }
    @IBAction func actionClose(_ sender: Any) {
        if let timer = randomTimerInterval  {
            if timer.isPause {
                timer.start()
                self.btnClose.setTitle("Close", for: .normal)
            } else {
                timer.stop()
                self.btnClose.setTitle("Start", for: .normal)
            }
        }
    }
    
}

typealias TimerUpdateBlock = (_ : ()) -> Void

class RandomTimerInterval {
    private var timer: Timer?
    private var updateBlock: TimerUpdateBlock?
    
    init(block: @escaping TimerUpdateBlock) {
        updateBlock = block
    }
    
    private func randomInterval() -> TimeInterval {
        let interval = TimeInterval(arc4random_uniform(400) + 100)/1000
        //print(interval)
        return interval
    }
    
    public func start(){
        timer = Timer.scheduledTimer(timeInterval: randomInterval(),
                                     target: self,
                                     selector: #selector(update),
                                     userInfo: nil,
                                     repeats: false)
    }
    
    @objc private func update() {
        updateBlock?(())
        timer?.invalidate()
        start()
    }
    
    public func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    public var isPause: Bool {
        return timer == nil
    }
}
