//
//  ViewController.swift
//  URLScheme
//
//  Created by giftbot on 2020. 1. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBAction private func openSetting(_ sender: Any) {
    print("\n---------- [ openSettingApp ] ----------\n")
    guard let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) else { return }
    
    UIApplication.shared.open(url)
    
  }
  
  @IBAction private func openMail(_ sender: Any) {
    print("\n---------- [ openMail ] ----------\n")
//    let scheme = "mailto:"
//    let scheme = "mailto:someine@gmail.com"
    let scheme = "mailto:someone@gmail.com?cc=foo@bar.co@subject=title&bod=MyText"
    
    guard let url = URL(string: scheme),
        UIApplication.shared.canOpenURL(url)
        else { return }
    UIApplication.shared.open(url)
  }

  @IBAction private func openMessage(_ sender: Any) {
    print("\n---------- [ openMessage ] ----------\n")
    let url = URL(string: "sms:010-9999-9999&body=Hello")!
    
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
    
  }
  
  @IBAction private func openWebsite(_ sender: Any) {
    print("\n---------- [ openWebsite ] ----------\n")
    let url = URL(string: "http://google.com")!
    
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
  }
    
    // ↑ 위에는 시스템 앱
    // ↓ 아래에는 3rd party 앱
  
  @IBAction private func openFacebook(_ sender: Any) {
    print("\n---------- [ openFacebook ] ----------\n")
    // 3rd party 앱에 대해서 화이트리스트 등록 필요 info.plist에서 open as -> source code ->
//    <key>LSApplicationQueriesSchemes</key>
//    <array>
//        <string>fb</string>
//        <string>myApp</string>
//    </array>
    // 이거 붙여넣기
    // 최초 1회 넘어갈 때 이동을 허락하려면 이후부터는 바로 넘어감
    
    let url = URL(string: "fb:")!
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
    
  }
  
  @IBAction private func openMyApp(_ sender: Any) {
    print("\n---------- [ openMyApp ] ----------\n")
    
    //myApp://host?name=abc&age-10
    // - scheme : myApp
    // - host : host
    // - query: name=abc&age-10
    
    //열고 싶은 앱에는 반드시 URL scheme가 등록되어 있어야 한다.
    // scheme 등록법: PROJECT -> Info -> 하단 URL Types -> + 버튼 눌러서 URL scheme 칸에 이름 등록.
    // 주의 할점 : scheme 이름이 중복되는 경우 -> 더 유명하고 오래된 앱이 살아남기 때문에 중복되지 않도록 독특한 네이밍을 하는 것이 좋다
    
//    let url = URL(string: "myApp://host?name=abc&age10")!
//    guard UIApplication.shared.canOpenURL(url) else { return }
//    UIApplication.shared.open(url)
    
//    let url = URL(string: "instagram://user?username=foxwavez.insta")!
    let url = URL(string: "instagram://tag?name=japan")!
       guard UIApplication.shared.canOpenURL(url) else { return }
       UIApplication.shared.open(url)
  }
}




