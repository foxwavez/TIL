//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import AudioToolbox.AudioServices
import UIKit

final class NameWSViewController: UIViewController {
  
  // MARK: Properties
  
  private let nextButton: UIButton = {
    let button = UIButton()
    button.setTitle("Next", for: .normal)
    button.setTitleColor(.lightGray, for: .normal)
    button.setTitleColor(.init(red: 18/255, green: 90/255, blue: 153/255, alpha: 1.0), for: .selected)
    button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    button.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
    return button
  }()
  
  private let closeButton: UIButton = {
    let button = UIButton()
    let closeImage = UIImage(systemName: "xmark")
    button.setImage(closeImage, for: .normal)
    button.setPreferredSymbolConfiguration(.init(scale: .large), forImageIn: .normal)
    button.tintColor = .black
    button.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
    return button
  }()
  
  private let wsNameTextField: UITextField = {
    let textField = UITextField()
    let attrString = NSAttributedString(
      string: "Name your workspace",
      attributes: [.foregroundColor: UIColor.darkText.withAlphaComponent(0.5)]
    )
    textField.attributedPlaceholder = attrString
    textField.font = UIFont.systemFont(ofSize: 22, weight: .light)
    textField.enablesReturnKeyAutomatically = true
    textField.borderStyle = .none
    textField.returnKeyType = .go
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    return textField
  }()
  
  private let floatingLabel: UILabel = {
    let label = UILabel()
    label.text = "Name your workspace"
    label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    label.alpha = 0.0
    return label
  }()
  private var floatingCenterYConst: NSLayoutConstraint!
  
  private let indicatorView: UIActivityIndicatorView = {
    let indicatorView = UIActivityIndicatorView(style: .medium)
    indicatorView.hidesWhenStopped = true
    return indicatorView
  }()
  private var indicatorViewLeadingConst: NSLayoutConstraint!
  
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    wsNameTextField.becomeFirstResponder()
  }
  
  // MARK: - Setup
  
  private func setupViews() {
    view.backgroundColor = .white
    view.addSubviews([nextButton, closeButton])
    view.addSubviews([wsNameTextField, floatingLabel, indicatorView])
    
    navigationController?.navigationBar.isHidden = true
    wsNameTextField.delegate = self
  }
  
  private func setupConstraints() {
    nextButton.layout.top().trailing(constant: -16)
    closeButton.layout.leading(constant: 16).centerY(equalTo: nextButton.centerYAnchor)
    wsNameTextField.layout.leading(constant: 16).trailing(constant: -16).centerY(constant: -115)
    
    // Floating Label
    floatingLabel.layout.leading(equalTo: wsNameTextField.leadingAnchor)
    
    let defaultCenterYConst = floatingLabel.centerYAnchor.constraint(equalTo: wsNameTextField.centerYAnchor)
    defaultCenterYConst.priority = UILayoutPriority(500)
    defaultCenterYConst.isActive = true
    
    floatingCenterYConst = floatingLabel.centerYAnchor.constraint(equalTo: wsNameTextField.centerYAnchor, constant: -30)
    floatingCenterYConst.priority = .defaultLow   // 250
    floatingCenterYConst.isActive = true
    
    // indicatorView
    indicatorView.layout.centerY(equalTo: wsNameTextField.centerYAnchor)
    indicatorViewLeadingConst = indicatorView.leadingAnchor.constraint(equalTo: wsNameTextField.leadingAnchor)
    indicatorViewLeadingConst.isActive = true
  }
  
  
  // MARK: - Action Handle
  
  // import AudioToolbox.AudioServices
  private func vibrate() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
  }
  
  @objc private func didTapNextButton(_ sender: UIButton) {
    guard nextButton.isSelected, let text = wsNameTextField.text else { return vibrate() }
    guard !indicatorView.isAnimating else { return }
    
    let textSize = (text as NSString).size(withAttributes: [.font: wsNameTextField.font!])
    indicatorViewLeadingConst.constant = textSize.width + 8
    indicatorView.startAnimating()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
       self.indicatorView.stopAnimating()
       let vc = UrlWSViewController()
       vc.workspaceName = text
       self.navigationController?.pushViewController(vc, animated: true)
     }
  }
  
  @objc private func didTapCloseButton(_ sender: UIButton) {
    dismiss(animated: true)
  }
}


// MARK: - UITextFieldDelegate

extension NameWSViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    didTapNextButton(nextButton)
    return true
  }
  // 이미 글자가 바뀐 때를 기준
  func textFieldDidChangeSelection(_ textField: UITextField) {
      <#code#>
  }
  // 글자가 바뀌기 전을 기준
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let text = textField.text ?? ""
    
    // 블럭으로 잡아서 한번에 여러 개를 지우거나 paste로 여러 글자를 붙여넣기 하는 등 동작을 할 때는 range가 없으면 구현 할 수 없음
    // string은 그 때 그 때 들어오는 string만
    // using NSString
    let replacedText = (text as NSString).replacingCharacters(in: range, with: string)
    nextButton.isSelected = !replacedText.isEmpty
    
    UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
      if replacedText.isEmpty {
        self.floatingCenterYConst.priority = .defaultLow
        self.floatingLabel.alpha = 0.0
      } else {
        self.floatingCenterYConst.priority = .defaultHigh
        self.floatingLabel.alpha = 1.0
      }
      self.view.layoutIfNeeded()
    })
    return true
  }
}
