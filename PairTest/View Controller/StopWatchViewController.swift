//
//  ViewController.swift
//  PairTest
//
//  Created by Mayur Nilwant on 26/08/2022.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblStopwatch : UILabel!
    @IBOutlet weak var btnStartAndStop : UIButton!
    
    var stopWatchVM : StopWatchVM?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        self.lblTitle.text = Bundle().displayName
        // Do any additional setup after loading the view.
        self.configureStopWatchVM()
    }
    
    func configureStopWatchVM () {
        
        self.stopWatchVM = StopWatchVM(withCallback: { displayString in
            
            DispatchQueue.main.async {
                self.lblStopwatch.text = displayString
            }
            
        })
        
        self.stopWatchVM?.callButtonTitle = { (title) in
            
            self.btnStartAndStop.setTitle(title, for: .normal)
        }
    }


    
    @IBAction func toggle() {
        
        self.stopWatchVM?.toggle()
        
    }
}

