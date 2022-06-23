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

  private var defaultSegmentedControl: UISegmentedControl! = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white



    let customSegmentedControl = CustomSegmentedControl()
    customSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(customSegmentedControl)

    self.defaultSegmentedControl = UISegmentedControl()
    defaultSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(defaultSegmentedControl)

    // MARK: - Setting

    defaultSegmentedControl.insertSegment(withTitle: "First", at: 0, animated: true)
    defaultSegmentedControl.insertSegment(withTitle: "Second", at: 0, animated: true)
    defaultSegmentedControl.insertSegment(withTitle: "Third", at: 0, animated: true)


    defaultSegmentedControl.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
    defaultSegmentedControl.selectedSegmentTintColor = .white





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

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    defaultSegmentedControl.layer.cornerRadius = 16
    defaultSegmentedControl.layer.cornerCurve = .continuous
  }

}

final class CustomSegmentedControl: UISegmentedControl {


  init() {
    super.init(items: ["123","43", "3123"])

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
      foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")    //this removes the weird scaling animation!
      foregroundImageView.layer.masksToBounds = true
    }

  }
}

extension UIImage {

  public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
    let rect = CGRect(origin: .zero, size: size)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
    color.setFill()
    UIRectFill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    guard let cgImage = image?.cgImage else { return nil }
    self.init(cgImage: cgImage)
  }
}

extension UISegmentedControl {
  func fixBackgroundSegmentControl() {
    if #available(iOS 13.0, *) {
      //just to be sure it is full loaded
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        for i in 0...(self.numberOfSegments-1)  {
          let backgroundSegmentView = self.subviews[i]
          //it is not enogh changing the background color. It has some kind of shadow layer
          backgroundSegmentView.isHidden = true
        }
      }
    }
  }
}
