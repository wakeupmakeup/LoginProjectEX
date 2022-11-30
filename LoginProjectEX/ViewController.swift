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
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
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
        tf.frame.size.height = 48
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
        view.frame.size.height = 48
        view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        view.layer.cornerRadius = 5
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
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
        tf.frame.size.height = 48
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
        btn.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return btn
    }()
    
    //MARK: - 로그인버튼
    
    private let loginButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true // 어떤 영역 내에 잘라낸다 라는 의미의 설정이며 코너 잘라내기 처리를 할때 이렇게 세트로 사용된다.
        btn.layer.borderWidth = 1
        btn.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.isEnabled = false  // 처음에 버튼이 비활성화 하게 만들기.
        return btn
    }()
    
    // 스택 뷰 만들기.
    lazy var stackView: UIStackView = {
        //        let st = UIStackView()  -> 이렇게 설정한후 makeUI()에 등록한다.
        
        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        st.spacing = 18 // 스택 간의 내부 간격
        st.axis = .vertical  // 묶을 축 설정
        st.distribution = .fillEqually  // 간격을 어떻게 분배할 것인지?
        st.alignment = .fill // 좌,우,가운데 정렬 선택
        return st
    }()
    
    // password 재설정
    private let passwordResetButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("비밀번호 재설정", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    
    
    private let textViewHeight: CGFloat = 48
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeUI()
    }
    
    func makeUI() {
        view.backgroundColor = UIColor.black
        view.addSubview(stackView)
        view.addSubview(passwordResetButton)
        /// 가장 아래에 있는 view에 emailTextFieldView를 올리고 또 거기에다 emailInfoLabel과 emailTextField를 올렸다
        /// 그리고 이젠 stackView를 설정해야하니 emailTextFieldView 대신 stackView를 올린다.
        
        //        stackView.addSubview(emailTextfieldView)
        //        stackView.addSubview(passwordTextField)
        //      이렇게 접근해서 스택뷰에 올려도 상관은 없다. 하지만 더 편하게 할 수 있으니 이렇게는 난 사용 x
        
        
        
        
        
        // 오토레이아웃 설정.
        // 끝에 isActive = true 쓰기가 엄청 귀찮은데 한꺼번에 처리할때 쓰는 것.
        
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
            
            // 이메일 텍스트 필드 레이아웃 설정.
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),// 왼
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8), // 오
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15), // 위
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2), // 아래
            
            // passwordInfoLable레이아웃 설정.
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8), // 왼
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8), // 오
            passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor), // 가운데 정렬
            
            
            // passwordTextField 레이아웃 설정.
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 2),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            
            // passwordSecureButton 레이아웃 설정
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            // stackView 레이아웃 설정.
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36),
            
            
            // passwordResetButton 레이아웃 설정.
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
            
            /// 항상 잊지 말자. 이렇게 오토레이아웃 설정을 했다면 무조건 뷰를 등록해야한다. addSubview
        ])
        
        
    }
    // 표시 버튼을 눌렀을때 비밀번호 보이게 하기.
    @objc func passwordSecureModeSetting() {
        //passwordTextField.isSecureTextEntry = false // fasle라면 비밀번호 풀기, 굳이 if로 만들지 말고 toggle을 이용하면 편하다.
        
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    
    
    
    
    
    
    
    
    // 이 버튼을 눌렀을때 경고창 뜨게 만들기.
    @objc func resetButtonTapped() { // #selctor 로 만들었다면 끝에 무조건 @objc를 붙여야 인식된다.
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default) {action in
            print("확인버튼 눌림")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { cancel in
            print("취소버튼 눌림")
        }
        /// 버튼같은 것을 누르는 것을 액션이라 하는데 위에 버튼을 눌렀다면 그 액션이 클로저 부분으로 넘어가서 내가 설정한 것대로 동작하게 할 수 있음.
        /// 예로 다른 페이지로 넘어가기 등등
        
        
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    /// present는 다음화면으로 넘어가기 기능이다. 이는 아직 배우지 않았으나 다음 예시 코드때 학습해서 실전에서 써먹자.
        
    }
    
    
    
    
    
    
}
