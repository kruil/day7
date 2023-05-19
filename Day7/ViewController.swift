//
//  ViewController.swift
//  Day7
//
//  Created by Ilya Krupko on 19.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let imageView = UIImageView()
    
    let imageHeight = CGFloat(270)
    
    var topMargin: CGFloat {
        view.safeAreaInsets.top
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.frame = view.frame
        scrollView.contentSize = .init(width: view.frame.width, height: 1500)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.scrollIndicatorInsets = .init(
            top: imageHeight - topMargin,
            left: 0,
            bottom: 0,
            right: 0
        )
        scrollView.delegate = self
        
        imageView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 270)
        imageView.image = UIImage(named: "tiles")
        imageView.contentMode = .scaleAspectFill
        scrollView.addSubview(imageView)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        if yOffset < 0 {
            imageView.frame = .init(
                x: 0,
                y: yOffset,
                width: view.frame.width,
                height: imageHeight - yOffset
            )
            scrollView.scrollIndicatorInsets = .init(
                top: imageHeight - topMargin - yOffset,
                left: 0,
                bottom: 0,
                right: 0
            )
        }
    }
}
