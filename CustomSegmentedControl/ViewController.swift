//
//  ViewController.swift
//  CustomSegmentedControl
//
//  Created by 김호세 on 2022/06/23.
//

import UIKit
import FlexLayout
import PinLayout

class ViewController: UIViewController {

  private let customSegmentedControl: CustomSegmentedControl = {
    let control = CustomSegmentedControl()
    control.translatesAutoresizingMaskIntoConstraints = false
    return control
  }()

  private lazy var defaultSegmentedControl: UISegmentedControl = {

    let control = UISegmentedControl(items: ["First", "Second", "Third"])
    control.translatesAutoresizingMaskIntoConstraints = false
    control.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
    control.selectedSegmentTintColor = .white
    control.selectedSegmentIndex = 0

    return control
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    // MARK: - Layout

    view.addSubview(customSegmentedControl)
    view.addSubview(defaultSegmentedControl)

    NSLayoutConstraint.activate([
      customSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      customSegmentedControl.topAnchor.constraint(
        equalTo: view.safeAreaLayoutGuide.topAnchor,
        constant: 50
      ),
      customSegmentedControl.heightAnchor.constraint(equalToConstant: 48),

      defaultSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      defaultSegmentedControl.topAnchor.constraint(
        equalTo: customSegmentedControl.bottomAnchor,
        constant: 20
      ),
      defaultSegmentedControl.heightAnchor.constraint(equalToConstant: 48)
    ])

  }


  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    defaultSegmentedControl.layer.cornerRadius = 16
    defaultSegmentedControl.layer.cornerCurve = .continuous
  }

}

