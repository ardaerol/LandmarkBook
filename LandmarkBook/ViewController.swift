//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Arda Erol on 7.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //Landmark Book data
        landmarkNames.append("Colesseum")
        landmarkNames.append("Greet wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Taj mahal")
        landmarkNames.append("Stone")
        
        
        landmarkImages.append(UIImage(named: "colesseum.jpg")!)
        landmarkImages.append(UIImage(named: "greetwall.jpg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpg")!)
        landmarkImages.append(UIImage(named: "tajmahal.jpg")!)
        landmarkImages.append(UIImage(named: "stone.jpg")!)
        
        navigationItem.title = "Landmark Book"
    
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
              
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         chosenLandmarkName = landmarkNames[indexPath.row]
         chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController"{
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
}

