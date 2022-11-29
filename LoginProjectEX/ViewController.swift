//
//  ViewController.swift
//  LoginProjectEX
//
//  Created by 김태경 on 2022/11/29.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var emailTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        // 모서리 둥글게 처리하는 방법.
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.addSubview(emailTextFieldView)  // 그냥 ViewDidLoad에 올려놓으면 인식이 되지 않는다. 따라서 이를 해결할 수 있는 메서드는 addSubview라는 것.
                                             // 스토리보드에서 끌어다 놓으면 되는 부분이 바로 위에 부분이다.
        return view
    }()  // 뷰를 메모리에 올리는 활동.
    /// 위에 해당 방식은 클로저 방식이다. 이렇게 하면 코드를 정리 할 수 있다. 내부에서 정의한 것을 emailTextFieldView에 저장하는 것이다.
    /// 이 방식으로 오토레이아웃을 설정할 수는 없다. 왜냐면 오토레이아웃 부분이 더 나중에 실행될 부분이기 때문이다.
    /// 하지만 view를 올리는 것은 가능하다. (addSubview) 그것은 바로 lazy var로 선언을 하면 된다. lazy var는 미리 메모리에 올라가 있는 것이 아닌 실행이 될때 올라가기 때문에 가능하다.
    /// 먼저 ViewController 가 생성이 될때 view가 먼저 생성이 되야한다. 그렇기 때문에 view가 생성되고 나중에 lazy var 부분인 emailTextFieldView가 생성이 되니까 이때는 addSubview를 생성할 수 있다. 이 부분은 정답은 아니며 선호도에 따라 차이가 난다. 
    

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     

        makeUI()
    }
    
    func makeUI() { //
        
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

