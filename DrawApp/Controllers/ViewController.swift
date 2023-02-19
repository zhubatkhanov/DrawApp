//
//  ViewController.swift
//  DrawApp
//
//  Created by Sanzhar Zhubatkhanov on 18.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    
    override func loadView() {
        self.view = canvas
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.backgroundColor = .white
        addStackViews()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.rectangleTapped))
                        rectangle.addGestureRecognizer(tapGR)
                        rectangle.isUserInteractionEnabled = true
        let tapTraingle = UITapGestureRecognizer(target: self, action: #selector(self.triangleTapped))
            triangle.addGestureRecognizer(tapTraingle)
            triangle.isUserInteractionEnabled = true
        let tapPencil = UITapGestureRecognizer(target: self, action: #selector(self.drawTapped))
            draw.addGestureRecognizer(tapPencil)
            draw.isUserInteractionEnabled = true

    }
    
    private func addStackViews() {
        let shapesStackView = UIStackView(arrangedSubviews: [
            circle,
            rectangle,
            line,
            triangle,
            draw
        ])
        shapesStackView.distribution = .fillEqually
        
        let colorStackView = UIStackView(arrangedSubviews: [
            greenButton,
            blueButton,
            purpleButton,
            redButton,
            yellowButton
        ])
        colorStackView.distribution = .fillEqually

        let stackView = UIStackView(arrangedSubviews: [
            shapesStackView,
            fillMode,
            colorStackView,
            undoButton,
            clearButton
        ])
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }
    
    
    @objc private func handleColorChange(button: UIButton) {
        canvas.setStrokeColor(color: button.backgroundColor ?? .red)
    }
    
    @objc private func handleSwitchAction(sender: UISwitch) {
        if sender.isOn {
            canvas.fillMode = true
        }
        else{
            canvas.fillMode = false
        }
    }
    
    @objc private func circleTapped() {
        canvas.currentMode = .circle
    }
    
    @objc private func rectangleTapped() {
        canvas.currentMode = .rectangle
    }
    
    @objc private func lineTapped() {
        canvas.currentMode = .line
    }
    
    @objc private func triangleTapped() {
        canvas.currentMode = .triangle
    }
    
    @objc private func drawTapped() {
        canvas.currentMode = .freeDraw
    }
    
    @objc private func handleUndo() {
        canvas.undo()
    }
    
    @objc private func handleClear() {
        canvas.clear()
    }

    
    private let circle: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.addTarget(self, action: #selector(circleTapped), for: .touchUpInside)
        return button
    }()
    
    private let rectangle: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "rectangle"), for: .normal)
        button.addTarget(self, action: #selector(rectangleTapped), for: .touchUpInside)
        return button
    }()
    
    private let line: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "line.diagonal"), for: .normal)
        button.addTarget(self, action: #selector(lineTapped), for: .touchUpInside)
        return button
    }()
    
    private let triangle: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "triangle"), for: .normal)
        button.addTarget(self, action: #selector(triangleTapped), for: .touchUpInside)
        return button
    }()
    
    private let draw: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.addTarget(self, action: #selector(drawTapped), for: .touchUpInside)
        return button
    }()
    
    private let fillMode: UISwitch = {
        let SwitchControl = UISwitch()
            SwitchControl.isOn = false
            SwitchControl.isEnabled = true
            SwitchControl.onTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
            SwitchControl.translatesAutoresizingMaskIntoConstraints = false
            SwitchControl.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
            SwitchControl.isUserInteractionEnabled = true
        return SwitchControl
    }()
    
    let yellowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let purpleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .purple
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward"), for: .normal)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()

}

