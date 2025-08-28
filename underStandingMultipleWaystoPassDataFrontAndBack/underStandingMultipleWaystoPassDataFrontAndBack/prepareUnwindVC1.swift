//
//  prepareUnwindVC1.swift
//  underStandingMultipleWaystoPassDataFrontAndBack
//
//  Created by Student on 08/08/25.
//

import UIKit

class prepareUnwindVC1: UIViewController {
    var navigationTitle: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var firstDataTextView: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? prepareUnwindVC2 else { return }
        destinationVC.dataFromFirstVC = firstDataTextView.text
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let navigationTitle = navigationTitle {
            navigationItem.title = navigationTitle
        }
    }
    
    @IBAction func unwindToFirst(segue: UIStoryboardSegue) {
        guard let sourceVC = segue.source as? prepareUnwindVC2 else { return }
        navigationTitle = sourceVC.secondTextView.text
    }


}
