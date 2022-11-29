//
//  ViewController.swift
//  LoginProjectEX
//
//  Created by 김태경 on 2022/11/29.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextFieldView = UIView() // 뷰를 메모리에 올리는 활동.

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        makeUI()
    }
    
    func makeUI() { //
        
        emailTextFieldView.backgroundColor = UIColor.darkGray
        view.addSubview(emailTextFieldView)  // 그냥 ViewDidLoad에 올려놓으면 인식이 되지 않는다. 따라서 이를 해결할 수 있는 메서드는 addSubview라는 것.
                                             // 스토리보드에서 끌어다 놓으면 되는 부분이 바로 위에 부분이다.
        
        // 코드로 ui를 짠다면 무조건 이 설정을 처음에 해줘야 한다. 안그럼 오류난다.  
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        /// 자동으로 설정되는 오토레이아웃을 끄는 것이다. 왜냐면 수동으로 하나하나 잡아줄 것이기 때문에 꺼야 크랙이 발생하지 않는다.
        
        
        //오토 레이아웃 잡기.
        //스토리보드에선 높이 넓이 왼쪽 오른쪽 위 아래 다 잡아줬다. 이것을 코드로 하는 것일 뿐임.

        // 왼쪽에서 얼마를 띄울 것인지 (leadingAnchor), constraint -> 조건, "얼마나"를 정하는 메서드, equalTo - "어디에다"부분
        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        /// view.leadingAnchor -> 기본적인 view에서 앞쪽에다 맞추겠다. 라는 의미 그리고 constant는 얼마나 띄울 것인지 정하는 것임. 알기쉽게 한마디로 정리 하자면
        /// emailTextFieldView를 왼쪽에서 띄울 것인데 얼마만큼 띄울 것이냐면, 왼쪽 view 끝을 기준으로 24만큼 띄울 것이고 이 설정을 동작(.isActive)하게 할 것이다.

        // 오른쪽에서 얼마를 띄우 것인지 (trailingAnchor)
        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true

        // 높이에서 얼마를 띄울 것인지(topAnchor)
        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 313).isActive = true
        
        
        // 높이 자체를 설정하는 것
        // 높이는 기준이 없기 때문에 아래 처럼 설정하면 된다.
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }


}

