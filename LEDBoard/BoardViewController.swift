//
//  BoardViewController.swift
//  LEDBoard
//
//  Created by 마르 on 2023/07/24.
//

import UIKit

class BoardViewController: UIViewController {
    
    let colors = ["orangeColor","skyBlueColor","pinkColor","lemonColor","whiteColor"]
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var colorChangeButton: UIButton!
    @IBOutlet var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designTextfield()
        designButton(sendButton, label: "send")
        designButton(colorChangeButton, label: "Aa")
        
        designLabel()
        
    }
    
    func designTextfield(){
        userTextField.backgroundColor = .white
        userTextField.textColor = .black
    }
    
    func designButton(_ sender: UIButton, label: String){
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor.black.cgColor
        sender.backgroundColor = .white
        sender.setTitle(label, for: .normal)
        sender.setTitleColor(.systemPink, for: .normal)
    }
    
    func designLabel(){
        textLabel.textAlignment = .center
        textLabel.font = .boldSystemFont(ofSize: 60)
        textLabel.textColor = .systemPink
    }
    
    @IBAction func textWriteDone(_ sender: UITextField) {
        sendButtonClicked(sendButton)
    }
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        showText(userTextField.text!)
        view.endEditing(true)
    }
    
    @IBAction func colorChangeButtonClicked(_ sender: UIButton) {
        if let color = colors.randomElement(){
            textLabel.textColor = UIColor(named: color)
        }
        
        
    }
    
    func showText(_ text: String){
        textLabel.text = text
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        userTextField.isHidden = !userTextField.isHidden
        sendButton.isHidden = !sendButton.isHidden
        colorChangeButton.isHidden = !colorChangeButton.isHidden
    }
}
