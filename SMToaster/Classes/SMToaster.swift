import UIKit

@available(iOS 9.0, *)
public class SMToaster: UIView {
    
    private(set) var title: String = "Toast title"
    private(set) var message: String = "Toast message"
    
    private var titleLabel: UILabel = UILabel()
    private var messageLabel: UILabel = UILabel()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.text = title
        messageLabel.text = message
        setupViews()
    }
    
    public convenience init(title: String, message: String) {
        self.init(frame: CGRect.zero)
        self.title = title
        self.message = message
        self.titleLabel.text = title
        self.messageLabel.text = message
        setupViews()
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
        setupViews()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
}

@available(iOS 9.0, *)
extension SMToaster {
    
    private func setupViews() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .white
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 1.2
        layer.cornerRadius = 5
        
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.adjustsFontSizeToFitWidth = true
        
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .left
        messageLabel.adjustsFontSizeToFitWidth = true
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, messageLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        if let containerView = superview {
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15),
                rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15),
                bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -50),
                heightAnchor.constraint(equalToConstant: 120)
            ])
        } else {
            removeFromSuperview()
        }
    }
}
