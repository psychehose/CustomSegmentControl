//
//  CustomSegmentedControl.swift
//  CustomSegmentedControl
//
//  Created by KIM HOSE on 2022/06/24.
//

import UIKit

final class CustomSegmentedControl: UISegmentedControl {


  init() {
    super.init(items: ["First", "Second", "Third"])

    selectedSegmentIndex = 0
    backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)

    self.fixBackgroundSegmentControl()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }


  override func layoutSubviews() {
    super.layoutSubviews()

    layer.cornerRadius = 16
    layer.cornerCurve = .continuous


    let numver = numberOfSegments

    if subviews.indices.contains(numver), let foregroundImageView = subviews[numver] as? UIImageView {

      foregroundImageView.layer.cornerCurve = .continuous
      foregroundImageView.layer.cornerRadius = 16
      foregroundImageView.layer.borderColor = UIColor.white.cgColor
      foregroundImageView.layer.borderWidth = 1

      foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: 5, dy: 5)
      foregroundImageView.image = UIImage(color: .white)
      foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")
      foregroundImageView.layer.masksToBounds = true
    }

  }
}
