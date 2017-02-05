//
//  PhotoDetailViewController.swift
//  BodyShotz
//
//  Created by Wayne Dahlberg on 2/4/17.
//  Copyright © 2017 PineBit Studios. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detaildateLabel: UILabel!
    @IBOutlet var detailWeightLabel: UILabel!
    @IBOutlet var detailNoteLabel: UILabel!
    
    // make the title of the detail page the weight entered for that entry
    var entry: Entry! {
        didSet {
            navigationItem.title = String(format: "%f", entry.userWeight)
        }
    }
    
    var imageStore: ImageStore!
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        detailWeightLabel.text = String(format: "%f", entry.userWeight)
        detaildateLabel.text = String(describing: entry.dateCreated)
        
        // Get the entry key
        let key = entry.entryKey
        
        // if there is an associated image with the item
        // display it in the imageview
        let imageToDisplay = imageStore.image(forKey: key)
        detailImageView.image = imageToDisplay
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // clear first responder
        view.endEditing(true)
        
        // "save" changes to item
        // if keyboards/textfields are applicable
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: - Take a picture
    // implement later when the picture exists, but you want to re-take it.
    
    // MARK: - ImagePicker
    // implement that here
    
    // MARK: - UITextfield delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
