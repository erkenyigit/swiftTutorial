//
//  ViewController.swift
//  swiftPart1
//
//  Created by MacBook on 30.11.22.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let changeButton: UIButton = {
        
        let changeButton = UIButton()
        changeButton.backgroundColor = .white
        changeButton.setTitle("Random Photo!", for: .normal)
        changeButton.setTitleColor(.black, for: .normal)
        return changeButton
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(changeButton)
        getRandomPhoto()
        changeButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func getRandomPhoto(){
        let urlString = "https://picsum.photos/200"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        changeButton.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    
    

}

