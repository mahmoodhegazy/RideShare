//
//  LoginViewController.swift
//  RideShare
//
//  Created by Amr Guzlan on 2016-06-17.
//  Copyright © 2016 Amro Gazlan. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class LoginViewController: UIViewController {
    // creating an instance of an AVPlayer for background video of login/sign up page
    var backGroundPlayer : AVPlayer?
    @IBOutlet weak var loginView: LoginView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBAction func logIn(sender: UIButton) {
        print("clickedLogIn")
    }
    @IBAction func signUp(sender: UIButton) {
        print("clickedSignU")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackground()
        setUpButtonLook()
        // call the background video again if your application goes to background and foreground again
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.setUpBackground), name:UIApplicationWillEnterForegroundNotification , object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     setUpBackground is a function that is called in viewDidLoad to load a local background video to play
     as our background
     */
    func setUpBackground(){
        // load our video from our app bundle called video with the extension mov
        if let videoURL = NSBundle.mainBundle().URLForResource("video", withExtension: "mov"){
            // initialize our player with our fetched video url
            backGroundPlayer = AVPlayer(URL: videoURL)
            backGroundPlayer?.actionAtItemEnd = .None
            backGroundPlayer?.muted = true // mute the background vide, we don't want sound from it !
            
            //add the video to our view .. 
            
            let playerLayer = AVPlayerLayer(player: backGroundPlayer) // use core animation layer to display the video 
            playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill // preserve aspect ratio and resize to fill screen 
            playerLayer.zPosition = -1 // set it's possition behined anything in our view 
            
            playerLayer.frame = loginView.frame // set our player frame to our view's frame 
            
            loginView.layer.addSublayer(playerLayer)
            
            backGroundPlayer?.play()
            
            
            /// we will loop the video now using NSNotifcationCenter
            NSNotificationCenter.defaultCenter()
                .addObserver(self,
                             selector: #selector(LoginViewController.loopVideo),
                             name: AVPlayerItemDidPlayToEndTimeNotification,
                             object: nil)
        }
        
        
    }
    // loopVideo is a function that will loop the background vide of your loging/sing up page
    func loopVideo(){
        print("I'm still alive")
        backGroundPlayer?.seekToTime(kCMTimeZero)
        backGroundPlayer?.play()
    }
    func setUpButtonLook(){
        logInButton.layer.borderWidth = CGFloat(1.0)
        logInButton.layer.borderColor = UIColor.blackColor().CGColor
        logInButton.layer.cornerRadius = CGFloat(4.0)
        signUpButton.layer.borderWidth = CGFloat(1.0)
        signUpButton.layer.borderColor = UIColor.blackColor().CGColor
        signUpButton.layer.cornerRadius = CGFloat(4.0)

    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
