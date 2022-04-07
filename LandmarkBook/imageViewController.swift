//
//  imageViewController.swift
//  LandmarkBook
//
//  Created by Arda Erol on 7.04.2022.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedLandmarkName = " "
    var selectedLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        landmarkLabel.text=selectedLandmarkName
        imageView.image = selectedLandmarkImage
        
    }
    

    

}
