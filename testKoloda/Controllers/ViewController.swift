//
//  ViewController.swift
//  testKoloda
//
//  Created by Cem Kazım on 19.08.2020.
//  Copyright © 2020 Cem Kazım. All rights reserved.
//

import UIKit
import Koloda

class ViewController: UIViewController {

    @IBOutlet weak var myContentsKolodaView: KolodaView!
    
    var imageStock = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForKoloda()
        fetchImages()
        reloadImages()
    }
    
    func fetchImages() {
        guard let bttf = UIImage(named: "bttf.jpg"), let hendrix = UIImage(named: "hendrix.jpg"), let floyd = UIImage(named: "floyd.jpg") else { return }
        imageStock.append(bttf)
        imageStock.append(hendrix)
        imageStock.append(floyd)
    }
    
    func setupForKoloda() {
        myContentsKolodaView.delegate = self
        myContentsKolodaView.dataSource = self
    }
    
    func reloadImages() {
        myContentsKolodaView.reloadData()
    }
}

extension ViewController: KolodaViewDelegate, KolodaViewDataSource {
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: imageStock[index])
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return imageStock.count
    }
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        fetchImages()
        reloadImages()
    }
}
