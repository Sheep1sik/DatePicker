//
//  ViewController.swift
//  DatePicker
//
//  Created by 양원식 on 2023/06/11.
//

import UIKit

class ViewController: UIViewController {
    // 타이머가 구동되면 실행할 함수를 지정
    let timeSelector : Selector = #selector(ViewController.updateTime)
    
    // 타이머의 간격 값 1.0 = 1초
    let interval = 1.0
    
    // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    var count = 0

    
    @IBOutlet var CurrentTime: UILabel!
    @IBOutlet var PickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Timer.scheduledTimer(timeInterval(타이머 간격): interval, target(동작될 view): self, selector(타이머가 구동될 때 실행할 함수): timeSelector, userInfo(사용자 정보): nil, repeats(반복 여부): true)
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func ChangeDatePicker(_ sender: UIDatePicker) {
        // UIDatePicker 자료형 인수가 sender에 전달되고 해당 sender를 datePickerView에 저장
        let datePickerView = sender
        
        // 날짜를 출력하기 위하여 DateFormatter라는 클래스 상수 formatter를 선언
        let formatter = DateFormatter()
        
        // formatter의 dateFormat 속성 설정
        formatter.dateFormat = "yyyy-MM-dd HH : mm EEE"
        
        // 데이트 피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열로 변환
        PickerTime.text = "선택 시간 : " + formatter.string(from: datePickerView.date)
    }
    @objc func updateTime(){
        //현재 시간을 NSDate() 함수를 사용해 가져옴
        let date = NSDate()
        
        // 날짜를 출력하기 위해 DateFormatter라는 클래스의 상수 formatter를 선언
        let formatter = DateFormatter()
        
        // formatter의 dateFormat 속성 설정
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        // formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열로 변환
        CurrentTime.text = "현재 시간 : " + formatter.string(from: date as Date)
    }
}

