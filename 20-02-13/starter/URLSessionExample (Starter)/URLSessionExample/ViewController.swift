//
//  ViewController.swift
//  URLSessionExample
//
//  Created by giftbot on 2020. 2. 12..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    private let imageUrlStr = "https://loremflickr.com/860/640/cat"
    
    
    // MARK: - Sync method
    
    @IBAction private func syncMethod() {
        print("\n---------- [ syncMethod ] ----------\n")
        let url = URL(string: imageUrlStr)!
        
        
        //  Data(contentsOf:) : sync method
        // 1. URLSession
        // 2. Async
        //    DispatchQueue.global().async {
        //        if let data = try? Data(contentsOf: url) {
        //            DispatchQueue.main.async {
        //                self.imageView.image = UIImage(data: data)
        //            }
        //        }
        //    }
        
        URLSession.shared.dataTask(with: url) { (data, r, e) in
            if let data = data {
                DispatchQueue.main.sync {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }.resume() //이걸 잊으면 안된다 그러면 실행이 제대로 되지 않는다
    }
    
    
    // MARK: - URLComponents
    
    @IBAction private func urlComponentsExample(_ sender: Any) {
        print("\n---------- [ urlComponentsExample ] ----------\n")
        /*
         http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment
         */
        // 위 URL 구성을 보고 URLComponents의 각 파트를 수정해 위 구성과 같도록 만들어보기
        
        var components = URLComponents()
        components.scheme = "http"
        print(components)
        components.user = "username"
        print(components)
        components.password = "password"
        print(components)
        components.host = "www.example.com"
        print(components)
        components.port = 80
        print(components)
        components.path = "/index.html"    // path는 /로 시작해야 함
        print(components)
        components.query = "key1=value1&key2=value2"
        print(components)
        components.fragment = "myFragment"
        print(components)
        
        var comp = URLComponents(string: "http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment")
        comp?.queryItems = [
            URLQueryItem(name: "name", value: "tory"),
            URLQueryItem(name: "age", value: "5")
        ]
        print(comp?.url?.absoluteString ?? "")
    }
    
    
    
    // MARK: - URL Encoding Example
    
    @IBAction private func urlEncodingExample() {
        print("\n---------- [ urlEncodingExample ] ----------\n")
        
        // 영어 주소
        let urlStringE = "https://search.naver.com/search.naver?query=swift"
        print(URL(string: urlStringE) ?? "Nil")
        
        // 한글 주소
        let urlStringK = "https://search.naver.com/search.naver?query=%한글"
        print(URL(string: urlStringK) ?? "Nil")
        
        // 한글 주소 - 퍼센트 인코딩 필요
        let str = "https://search.naver.com/search.naver?query=%한글"
        let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let convertedURL = URL(string: queryEncodedStr)!
        print(convertedURL)
        
        // URI - 아스키 2 문자만 가능
        // IRI - 유니코드 문자까지 가능
        
        // URL -> String
        let encodedUrlString = "https://example.com/#color-%23708090"
        
        // % 인코딩 제거
        print(encodedUrlString.removingPercentEncoding ?? "")
        
        // String -> URL
        let originalString = "color-#708090"
        
        var allowed = CharacterSet.urlFragmentAllowed
        allowed.insert("#")
        
        let encodedString = originalString.addingPercentEncoding(withAllowedCharacters: allowed)!
        print(encodedString)
    }
    
    
    
    
    // MARK: - Session Configuration
    
    @IBAction private func sessionConfig(_ sender: Any) {
        print("\n---------- [ Session Configuration ] ----------\n")
        
        _ = URLSessionConfiguration.default
        _ = URLSessionConfiguration.ephemeral // 캐시를 남기지 않는
        _ = URLSessionConfiguration.background(withIdentifier: "kr.foxwavez.backgroundConfig") // 백그라운드에서 사용할 수 있게 하는
        
        let sessionConfig = URLSessionConfiguration.default
        // 기본갑 true. Wi-Fi만 가능하도록
        sessionConfig.allowsCellularAccess = false
        // 기본값 4
        sessionConfig.httpMaximumConnectionsPerHost = 5 // 최대한 몇 개의 호스트를
        // 기본값 60초
        sessionConfig.timeoutIntervalForRequest = 20
        // 기본값 .userProtocolCachePolicy
        sessionConfig.requestCachePolicy = .useProtocolCachePolicy
        // 기본값 false - 네트워크 연결 안정적이지 않으면 바로 끊어버리는
        sessionConfig.waitsForConnectivity = true // 네트워크 연결이 안정적이게 될 때까지 기다리는
        
        // 기본 캐시 URLCache.shared
        // 메모리 - 16 KB (16 * 1024 = 16_384)
        // 디스크 - 265 MB (256 * 1024 * 1024 = 268_435_456)
        let myCache = URLCache(memoryCapacity: 16_384, diskCapacity: 268_435_456, diskPath:  nil)
        sessionConfig.urlCache = myCache
        
        let cache = URLCache.shared
        sessionConfig.urlCache = cache
        
        print(cache.memoryCapacity) // 500KB
        print(cache.currentMemoryUsage) // 약 9.5MB
        
        print(cache.diskCapacity) //
        print(cache.currentDiskUsage) //
        
        // (user home directory)/Library/Caches/(application bundle id)/
        
        cache.removeAllCachedResponses()
        
        
        let mySession = URLSession(configuration: sessionConfig)
        let url = URL(string: imageUrlStr)!
        let task = mySession.dataTask(with: url) {
            [weak self] (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)!
                print("download completed")
            }
        }
        task.resume()
    }
    
    
    // MARK: - Get, Post, Delete
    
    // https://jsonplaceholder.typicode.com/
    
    @IBAction func requestGet(_ sender: Any) {
        print("\n---------- [ Get Method ] ----------\n")
        let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
        guard let url = URL(string: todoEndpoint) else { return }
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard error == nil else { return print(error!.localizedDescription)}
            guard let response = response as? HTTPURLResponse,
                (200..<300).contains(response.statusCode),
                response.mimeType == "application/json"
                else { return }
            guard let data = data else { return print("No Data") }
            
            guard let todo = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let todoID = todo["id"] as? Int,
                let todoTitle = todo["title"] as? String
                else { return print("Could not get parsed data")}
            
            print("ID: ", todoID)
            print("Title:", todoTitle)
        }
        task.resume()
    }
    
    
    @IBAction func requestPost(_ sender: Any) {
        print("\n---------- [ Post Method ] ----------\n")
        let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
        
        guard let todosURL = URL(string: todoEndpoint) else { return }
        
        let newToDo: [String: Any] = ["title": "My ToDo", "userID": "20"]
        guard let jsonToDo = try? JSONSerialization.data(withJSONObject: newToDo) else { return }
        
        var urlRequest = URLRequest(url: todosURL)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = jsonToDo
        
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            guard let data = data,
                let newItem = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            print(newItem)
            if let id = newItem["id"] as? Int {
                print(id)
            }
        }
        task.resume()
    }
    
    @IBAction func requestDelete(_ sender: Any) {
        print("\n---------- [ Delete Method ] ----------\n")
        let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1" // 정학히 지울 부분을 지정
        
        let url = URL(string: todoEndpoint)!
        
        //URLRequest로 url 지정하고 method 연결
        // 지우기만 하면 되니까 body에 데이터 넣지 않아도 됨
        var urlReauest = URLRequest(url: url)
        urlReauest.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: urlReauest) { (data, response, error)  in
            guard error == nil else { return print(error!.localizedDescription) }
            guard let data = data else { return print("No Data") }
            print("DELETE ok")
            
            print((response as! HTTPURLResponse).statusCode)
            
            if let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                print(data)
                print(jsonObject)
            }
        }
        task.resume()
    }
}
