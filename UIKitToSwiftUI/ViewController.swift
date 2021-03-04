//
//  ViewController.swift
//  UIKitToSwiftUI
//
//  Created by Sujeet.Kumar on 17/02/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    var binding:HostingViewBinding = HostingViewBinding()
    
    @IBOutlet weak var hostingView: UIView! {
        didSet {
            hostingView.backgroundColor = .blue
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        print("button tapped")
    }
    
    
    @IBAction func inputTextAction(_ sender: UITextField) {
        let enteredText = sender.text ?? "tt"
        self.binding.text = enteredText
    }
    
    //MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.binding.onTapAction = { [weak self] (typedValue) in
            guard let self = self else { return }
            print("typedValue = \(typedValue)")
        }
        
        
        // Do any additional setup after loading the view.
        addHostingView()
    }


    private func addHostingView() {
        let hostingController = UIHostingController(rootView: HostingView(binder: binding).background(Color(.yellow)) )
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.frame = self.hostingView.bounds
        self.hostingView.addSubview(hostingController.view)
    }
}

extension ViewController:UITextFieldDelegate {
     func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
     func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
            if textField.text != "" {
                let enteredText = textField.text ?? "tt"
                self.binding.text = enteredText
            }
        
        return true
    }
}
