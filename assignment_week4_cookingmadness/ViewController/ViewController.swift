//
//  ViewController.swift
//  assignment_week4_cookingmadness
//
//  Created by 황신아 on 2023/01/11.
//

import UIKit
import AVFoundation

var ask = 3
var ask_w = 2
var score = 0
var people = 2

 
class ViewController: UIViewController {
    
    // 남자 타이머
    var man1timer = Timer()
    var totalTime = 25  // 남자가 기다리는 총 시간
    var secondsPassed = 0   // 남자 오고 지난 시간
    
    // 여자 타이머
    var womanTimer = Timer()
    var secondsPassed_w = 0   // 여자 오고 지난 시간
    
    // 그릴1 타이머
    var grill1timer = Timer()
    var meatTotalTime = 7  // 고기 익는 시간
    var meat1secondsPassed = 0   // 고기 올린후 지난 시간
    
    
    // 그릴2 타이머
    var grill2timer = Timer()
    var meat2secondsPassed = 0   // 고기 올린후 지난 시간
    
    @IBOutlet weak var manImage: UIImageView!
    
    @IBOutlet weak var firstGrillImage: UIImageView!
    
    @IBOutlet weak var secondGrillImage:
    UIImageView!
    
    @IBOutlet weak var plateMeat: UIImageView!
    
    @IBOutlet weak var plateLettuceMeat: UIImageView!
    
    @IBOutlet weak var bubble: UIImageView!
    
    
    @IBOutlet weak var bubbleLettuceMeat: UIImageView!
    
    @IBOutlet weak var bubbleMeat: UIImageView!
    
    @IBOutlet weak var bubbleBeer: UIImageView!
    
    
    @IBOutlet weak var peopleLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var womanImage: UIImageView!
    
    @IBOutlet weak var bubble_w: UIImageView!
    
    @IBOutlet weak var bubbleBeer_w: UIImageView!
    
    @IBOutlet weak var bubbleMeat_w: UIImageView!
    
    
    @IBOutlet weak var womanTimerBar: UIProgressView!
    
    // 남자 1 타이머
    @IBOutlet weak var man1TimerBar: UIProgressView!
    
    // 그릴 1 타이머
    @IBOutlet weak var grill1TimerBar: UIProgressView!
    
    // 그릴 2 타이머
    @IBOutlet weak var grill2TimerBar: UIProgressView!
    
    // 생고기 추가 버튼
    @IBAction func meatAdd(_ sender: Any) {
        
        
        
        
        if (firstGrillImage.isHidden == true){
            
            // 그릴에 고기 놓을때 생고기가 올라가도록 다시 생고기 이미지로 변경
            firstGrillImage.image=UIImage(named: "realRaw.png")
            
            // 첫번째 그릴이 비어있다면 첫번째 그릴에 고기 추가
            firstGrillImage.isHidden = false
            
            // 그릴1 타이머 시작
            self.grill1TimerBar.isHidden = false
            self.grill1TimerBar.progress = 0.0
            self.meat1secondsPassed = 0
            self.grill1timer.invalidate()  // 타이머 사용 전마다 0으로 초기화해주기
            self.grill1timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.grill1UpdateCounter), userInfo: nil, repeats: true)
            
            // 8초뒤 고기 익도록
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 8) {
                self.firstGrillImage.image=UIImage(named: "goodmeat.png")   //고기 익음
                
//
//                // 그릴1 타이머2 시작
//                self.grill1TimerBar.progressTintColor = .red
//                self.grill1TimerBar.progress = 0.0
//                self.meat1secondsPassed = 0
//                self.grill1timer.invalidate()  // 타이머 사용 전마다 0으로 초기화해주기
//                self.grill1timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.grill1UpdateCounter), userInfo: nil, repeats: true)
            
                }
//
//            // 5초뒤 고기 타도록
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) {
//                self.firstGrillImage.image=UIImage(named: "burnt.png")
//
//
//
//            }
        }
            else if (secondGrillImage.isHidden == true){
                secondGrillImage.image=UIImage(named: "realRaw.png")
                // 첫번째 그릴에 이미 고기가 있고, 두번째 그릴이 비어있다면 두번째 그릴에 고기추가
                secondGrillImage.isHidden = false
                
                
                // 그릴2 타이머 시작
                self.grill2TimerBar.isHidden = false
                self.grill2TimerBar.progress = 0.0
                self.meat2secondsPassed = 0
                self.grill2timer.invalidate()  // 타이머 사용 전마다 0으로 초기화해주기
                self.grill2timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.grill2UpdateCounter), userInfo: nil, repeats: true)
                
                // 8초뒤 고기 익도록
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 8) {
                    self.secondGrillImage.image=UIImage(named: "goodmeat.png")  //고기 익음
                }
                
                
            }else{ // 두 그릴에 모두 고기가 있으면 작동x
                
            }
    }
    
    // 양상추 추가 버튼
    @IBAction func lettuceAdd(_ sender: Any) {
        self.plateLettuceMeat.image = UIImage(named: "meat_with_lettuce.png")
    }
    
    // 맥주 버튼
    @IBAction func giveBeer(_ sender: Any) {
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                if(self.bubbleBeer.isHidden==false){
                    self.bubbleBeer.isHidden = true
                    ask -= 1
                }
                else{self.bubbleBeer_w.isHidden=true
                    ask_w -= 1
                }
            }
            usleep(1000000)
           
        
            self.finishServing()
            self.finishServing_w()
            
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
            
        }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let popupVC = storyBoard.instantiateViewController(withIdentifier: "gameStartViewController")
            popupVC.modalPresentationStyle = .overCurrentContext
            
            self.present(popupVC, animated: true, completion: nil)
        }
        manImage.isHidden = true
        bubble.isHidden = true
        bubbleLettuceMeat.isHidden = true
        bubbleMeat.isHidden = true
        bubbleBeer.isHidden = true
        womanImage.isHidden = true
        bubble_w.isHidden = true
        bubbleMeat_w.isHidden = true
        bubbleBeer_w.isHidden = true
        
        firstGrillImage.isHidden = true
        secondGrillImage.isHidden = true
        plateMeat.isHidden = true
        plateLettuceMeat.isHidden = true
        man1TimerBar.isHidden = true
        womanTimerBar.isHidden = true
        
        // 남자1 타이머 회전
        man1TimerBar.transform = CGAffineTransform(rotationAngle: .pi * 1.5)
        
        // 여자 타이머 회전
        womanTimerBar.transform = CGAffineTransform(rotationAngle: .pi * 1.5)
        
        grill1TimerBar.isHidden = true
        grill1TimerBar.layer.borderColor = UIColor.white.cgColor
        grill1TimerBar.layer.borderWidth = 0.7
        grill1TimerBar.layer.cornerRadius = 2.5
        grill2TimerBar.isHidden = true
        grill2TimerBar.layer.borderColor = UIColor.white.cgColor
        grill2TimerBar.layer.borderWidth = 0.7
        grill2TimerBar.layer.cornerRadius = 2.5
        
       
        
        
        // 남자1 스레드
        DispatchQueue.global().async {
            usleep(3000000)
            // 남자 등장
            DispatchQueue.main.async {
                self.manImage.isHidden = false
            }
            
            usleep(1000000)
            
            // 등장 후 1초 뒤 요청사항 말풍선 띄우기
            DispatchQueue.main.async {
                self.bubble.isHidden = false
                self.bubbleLettuceMeat.isHidden = false
                self.bubbleMeat.isHidden = false
                self.bubbleBeer.isHidden = false
                
                // 남자 타이머 시작
                self.man1TimerBar.isHidden = false
                self.man1TimerBar.progress = 0.0
                self.secondsPassed = 0
                self.man1timer.invalidate()  // 타이머 사용 전마다 0으로 초기화해주기
                self.man1timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)
            }
            ask=3
            
            // 언제든 남자가 다 받으면 남자 퇴장
            self.finishServing()
            
            
            // 10초 지나면 주황색으로
            usleep(10000000)
            DispatchQueue.main.async {
                self.man1TimerBar.progressTintColor = .orange
            }
            
            // 남자 기다리다가 19초 뒤에는 화내기
            usleep(9000000)
            DispatchQueue.main.async {
                self.manImage.image=UIImage(named: "madman.png")
                self.man1TimerBar.progressTintColor = .red
            }
            
            usleep(7000000)
            DispatchQueue.main.async {
                if(self.manImage.isHidden == false){
                    // 실패 팝업 띄우기
                    let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
                    let popupfailVC = storyBoard.instantiateViewController(withIdentifier: "failViewController")
                    popupfailVC.modalPresentationStyle = .overCurrentContext
                    
                    self.present(popupfailVC, animated: true, completion: nil)
                }
            }
            
        }
        
        // 여자 스레드
        DispatchQueue.global().async {
            usleep(11000000)
            // 여자 등장
            DispatchQueue.main.async {
                self.womanImage.isHidden = false
            }
            
            usleep(1000000)
            
            // 등장 후 1초 뒤 요청사항 말풍선 띄우기
            DispatchQueue.main.async {
                self.bubble_w.isHidden = false
                self.bubbleMeat_w.isHidden = false
                self.bubbleBeer_w.isHidden = false
                
                // 여자 타이머 시작
                self.womanTimerBar.isHidden = false
                self.womanTimerBar.progress = 0.0
                self.secondsPassed_w = 0
                self.womanTimer.invalidate()  // 타이머 사용 전마다 0으로 초기화해주기
                self.womanTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter_w), userInfo: nil, repeats: true)
            }
            ask_w = 2
            
            // 언제든 여자가 다 받으면 여자 퇴장
            self.finishServing()
            
            
            // 10초 지나면 주황색으로
            usleep(10000000)
            DispatchQueue.main.async {
                self.womanImage.image=UIImage(named: "sad_woman.png")
                self.womanTimerBar.progressTintColor = .orange
            }
            
            // 여자 기다리다가 19초 뒤에는 화내기
            usleep(9000000)
            DispatchQueue.main.async {
                self.womanImage.image=UIImage(named: "angry_woman.png")
                self.womanTimerBar.progressTintColor = .red
            }
            
            usleep(9000000)
            DispatchQueue.main.async {
                if(self.womanImage.isHidden == false){
                    // 실패 팝업 띄우기
                    let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
                    let popupfailVC = storyBoard.instantiateViewController(withIdentifier: "failViewController")
                    popupfailVC.modalPresentationStyle = .overCurrentContext
                    
                    self.present(popupfailVC, animated: true, completion: nil)
                }
            }
    }
        
        
        
        // firstGrillImage 클릭시 action 추가
        let tapfirstGrillImage = UITapGestureRecognizer(target: self, action: #selector(self.firstGrillImageTapped))
        firstGrillImage.addGestureRecognizer(tapfirstGrillImage)
        firstGrillImage.isUserInteractionEnabled = true
        
        
        // secondGrillImage 클릭시 action 추가
        let tapsecondGrillImage = UITapGestureRecognizer(target: self, action: #selector(self.secondGrillImageTapped))
        secondGrillImage.addGestureRecognizer(tapsecondGrillImage)
        secondGrillImage.isUserInteractionEnabled = true
        
        // plateMeat 클릭시 action 추가
        let tapPlateMeat = UITapGestureRecognizer(target: self, action: #selector(self.plateMeatTapped))
        plateMeat.addGestureRecognizer(tapPlateMeat)
        plateMeat.isUserInteractionEnabled = true
        
        // plateLettuceMeat 클릭시 action 추가
        let tapPlateLettuceMeat = UITapGestureRecognizer(target: self, action: #selector(self.plateLettuceMeatTapped))
        plateLettuceMeat.addGestureRecognizer(tapPlateLettuceMeat)
        plateLettuceMeat.isUserInteractionEnabled = true
        
        
    }
    
    
    // firstGrillImage 클릭시 action
    @objc func firstGrillImageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            
            // 고기가 다 익었다면
            if(firstGrillImage.image==UIImage(named: "goodmeat.png")){
                
                // 그릴 위 고기 사라지고
                firstGrillImage.isHidden = true
                
                // 쟁반위에 고기가 생기도록
                plateMeat.isHidden = false
                self.grill1TimerBar.isHidden = true
            }
            
        }
    }
    // secondGrillImage 클릭시 action
    @objc func secondGrillImageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            // 고기가 다 익었다면
            if(secondGrillImage.image==UIImage(named: "goodmeat.png")){
                secondGrillImage.isHidden = true
                plateLettuceMeat.isHidden = false
                self.grill2TimerBar.isHidden = true
            }
        }
    }
        
    // plateMeat 클릭시 action
    @objc func plateMeatTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                    self.plateMeat.isHidden = true
                    if(self.bubbleMeat.isHidden == false){
                        
                        self.bubbleMeat.isHidden = true
                        ask -= 1
                    }
                    else{
                        self.bubbleMeat_w.isHidden = true
                        ask_w -= 1
                        
                    }
                    
                }
                usleep(1000000)
                
                self.finishServing()
                self.finishServing_w()
            }
        }
        
    }
    
    // plateLettuceMeat 클릭시 action
    @objc func plateLettuceMeatTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                    self.plateLettuceMeat.isHidden = true
                    self.bubbleLettuceMeat.isHidden = true
                }
                usleep(1000000)
                ask -= 1
                self.finishServing()
            }
        }
        
    }
    
    // 남자가 요청 음식을 다 받으면 사라지고 스코어 올라가도록
    func finishServing(){
        if(ask==0){
            //스코어 100점 추가
            score = 100
            DispatchQueue.main.async {
                self.manImage.isHidden = true
                self.bubble.isHidden = true
                self.man1TimerBar.isHidden = true
                people = 1
                self.peopleLabel.text = String(people)
                self.scoreLabel.text = "score : \(score) / 200"
            }
           
              
        }
            
    }
    
    // 여자가 요청 음식을 다 받으면 사라지고 스코어 올라가도록
    func finishServing_w(){
        if(ask_w==0){
            //스코어 100점 추가
            score = 200
            DispatchQueue.main.async {
                self.womanImage.isHidden = true
                self.bubble_w.isHidden = true
                self.womanTimerBar.isHidden = true
                people = 0
                self.peopleLabel.text = String(people)
                self.scoreLabel.text = "score : \(score) / 200"
            }
            usleep(1000000)
            DispatchQueue.main.async {
                // 성공 팝업 띄우기
                let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
                let popupSucceedVC = storyBoard.instantiateViewController(withIdentifier: "succeedViewController")
                popupSucceedVC.modalPresentationStyle = .overCurrentContext
                
                self.present(popupSucceedVC, animated: true, completion: nil)
            }
              
        }
        
    }

    
    // 남자1 타이머 함수
    @objc func updateCounter() {
            // 지나간 시간이 전체보다 작다면
            if secondsPassed < totalTime {
                man1TimerBar.progress = Float(totalTime - secondsPassed) / Float(totalTime)
                // 지나간 시간 1 추가
                secondsPassed += 1
            } else{
                //타이머 멈추기
                man1timer.invalidate()  // when the timer has done, remove it
                man1TimerBar.progress = 1.0
        }
    }
    
    // 여자 타이머 함수
    @objc func updateCounter_w() {
            // 지나간 시간이 전체보다 작다면
            if secondsPassed_w < totalTime {
                womanTimerBar.progress = Float(totalTime - secondsPassed_w) / Float(totalTime)
                // 지나간 시간 1 추가
                secondsPassed_w += 1
            } else{
                //타이머 멈추기
                womanTimer.invalidate()  // when the timer has done, remove it
                womanTimerBar.progress = 1.0
        }
    }

    
    // 그릴1 타이머 함수
    @objc func grill1UpdateCounter() {
            // 지나간 시간이 전체보다 작다면
            if meat1secondsPassed < meatTotalTime {
                grill1TimerBar.progress = Float(meat1secondsPassed) / Float(meatTotalTime)
                // 지나간 시간 1 추가
                meat1secondsPassed += 1
            } else{
                //타이머 멈추기
                grill1timer.invalidate()  // when the timer has done, remove it
                grill1TimerBar.progress = 1.0
        }
    }

    // 그릴2 타이머 함수
    @objc func grill2UpdateCounter() {
            // 지나간 시간이 전체보다 작다면
            if meat2secondsPassed < meatTotalTime {
                grill2TimerBar.progress = Float(meat2secondsPassed) / Float(meatTotalTime)
                // 지나간 시간 1 추가
                meat2secondsPassed += 1
            } else{
                //타이머 멈추기
                grill2timer.invalidate()  // when the timer has done, remove it
                grill2TimerBar.progress = 1.0
        }
    }

}

