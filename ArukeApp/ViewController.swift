//
//  ViewController.swift
//  ArukeApp
//
//  Created by mshimomura on 2021/11/21.
//

//  com.shimomura.ArukeApp://aruke.jp.auth0.com/ios/com.shimomura.ArukeApp/callback
//  com.shimomura.ArukeApp://aruke.jp.auth0.com/ios/com.shimomura.ArukeApp/callback

import UIKit
import Auth0
import AuthenticationServices

class ViewController: UIViewController {
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func loginButton2(_ sender: Any) {
        Auth0
            .webAuth()
            .scope("openid profile")
            .audience("https://aruke.jp.auth0.com/userinfo")
            .start { result in
                switch result {
                case .failure(let error):
                    // Handle the error
                    print("ログインエラー")
                    print("Error: \(error)")
                case .success(let credentials):
                    // Do something with credentials e.g.: save them.
                    // Auth0 will automatically dismiss the login page
                    self.status.text = "ログイン済み"
                    print("ログイン完了")
                    print("Credentials: \(credentials)")
                }
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        Auth0
            .webAuth()
            .clearSession(federated: false) { result in
                if result {
                    // Session cleared
                    self.status.text = "非ログイン状態"
                }
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        status.text = "非ログイン状態"
    }
    
    


}

