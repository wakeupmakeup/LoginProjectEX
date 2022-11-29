//
//  ViewController.swift
//  LoginProjectEX
//
//  Created by 김태경 on 2022/11/29.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 이메일(아이디) 입력하는 텍스트 뷰
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.addSubview(emailTextFieldView)
        view.addSubview(emailInfoLabel)
        /// addSubview를 사용하는 순서도 바뀌면 절대 안된다. 치즈 위에 햄, 햄 위에 치즈 같은 개념이다.
        return view
    }()
    
    // 이메일 주소 안내 문구
    private var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    // login
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        
        tf.frame.size.height = 18
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none  // 자동으로 첫 글자를 대문자로 바꿔주는 것
        tf.autocorrectionType = .no        // 자동으로 글자 타입 잡아주는것
        tf.spellCheckingType = .no         // 오타 체크
        tf.keyboardType = .emailAddress
        
        return tf
    }()
    
    
    // MARK: - 비밀번호 입력 필드
    
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
//        view.frame.size.height = 60
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 12
        return view
    }()
    
    
    // password 안내 문구
    private var passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    // password TextField
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        
        tf.backgroundColor = .darkGray
        tf.frame.size.height = 60
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true  // 비밀번호 입력을 가리는 처리
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    
    // 비밀번호에 "표시" 버튼으로 가리기 활성/비활성화 만들기.
    
    private let passwordSecureButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("표시", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return btn
    }()
    
    //MARK: - 로그인버튼
    
    private let loginButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 27.5
        btn.clipsToBounds = true // 어떤 영역 내에 잘라낸다 라는 의미의 설정이며 코너 잘라내기 처리를 할때 이렇게 세트로 사용된다.
        btn.layer.borderWidth = 0
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        btn.isEnabled = false  // 처음에 버튼이 비활성화 하게 만들기.
        return btn
    }()
    
    // 스택 뷰 만들기.
    lazy var stackView: UIStackView = {
//        let st = UIStackView()  -> 이렇게 설정한후 makeUI()에 등록한다.
        
        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextField])
        st.spacing = 16 // 스택 간의 내부 간격
        st.axis = .vertical  // 묶을 축 설정
        st.distribution = .fillEqually  // 간격을 어떻게 분배할 것인지?
        st.alignment = .fill // 좌,우,가운데 정렬 선택
        return st
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        makeUI()
    }
    
    func makeUI() {
        view.addSubview(emailTextFieldView)
        /// 가장 아래에 있는 view에 emailTextFieldView를 올리고 또 거기에다 emailInfoLabel과 emailTextField를 올렸다.
        
//        stackView.addSubview(emailTextfieldView)
//        stackView.addSubview(passwordTextField)
//      이렇게 접근해서 스택뷰에 올려도 상관은 없다. 하지만 더 편하게 할 수 있으니 이렇게는 난 사용 x
        
        
        
        

        // 오토레이아웃 설정.
        // 끝에 isActive = true 쓰기가 엄청 귀찮은데 한꺼번에 처리할때 쓰는 것.
        
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
            /// 항상 잊지 말자. 이렇게 오토레이아웃 설정을 했다면 무조건 뷰를 등록해야한다. addSubview
        ])
        
        
//        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
//        emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8).isActive = true
//        emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8).isActive = true
//        emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor).isActive = true
//        /// 항상 잊지 말자. 이렇게 오토레이아웃 설정을 했다면 무조건 뷰를 등록해야한다. addSubview
        
        
        
        
        
        
        
        
        
        // 이메일 텍스트 필드 레이아웃 설정.
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),// 왼
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8), // 오
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15), // 위
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2) // 아래
        ])
    }
}
