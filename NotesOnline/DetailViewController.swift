//
//  DetailViewController.swift
//  NotesOnline
//
//  Created by Zac Holland on 8/29/17.
//  Copyright © 2017 Bandwidth Bandits. All rights reserved.
//

import UIKit
import CloudKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                let record = detail as CKRecord
                let body = record["body"] as! String
                label.text = body
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: CKRecord? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

