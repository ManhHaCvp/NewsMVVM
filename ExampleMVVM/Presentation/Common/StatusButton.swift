import Foundation
import UIKit

enum StatusType {
    case follow
    case save

    var trueText: String {
        switch self {
        case .follow: return "Following"
        case .save: return "Saved"
        }
    }

    var falseText: String {
        switch self {
        case .follow: return "Follow"
        case .save: return "Save"
        }
    }

    var showsPlusIcon: Bool {
        switch self {
        case .follow: return true
        case .save: return false
        }
    }
}

protocol StatusButtonDelegate: AnyObject {
    func onClickButton()
}

class StatusButton: UIView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var plusImage: UIImageView!
    
    weak var delegate: StatusButtonDelegate?
    private var statusType: StatusType = .follow
    private var isActive: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    private func setupView() {
        guard let contentView = Bundle.main.loadNibNamed("StatusButton", owner: self, options: nil)?.first as? UIView else {
            return
        }
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentView)
        
        let listConstraint = [
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(listConstraint)

    }
    
//    private func loadData(delegate: StatusButtonDelegate, data: InformationData) {
//        self.delegate = delegate
//    }
    func configure(type: StatusType, isActive: Bool, delegate: StatusButtonDelegate? = nil) {
        self.statusType = type
        self.isActive = isActive
        self.delegate = delegate
        updateUI()
    }

    private func updateUI() {
        title.text = isActive ? statusType.trueText : statusType.falseText
        plusImage.isHidden = !(statusType.showsPlusIcon && !isActive)

        title.textColor = isActive ? .white : .systemBlue
        backgroundColor = isActive ? .systemBlue : .white
        layer.cornerRadius = 6
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        isActive.toggle()
        updateUI()
        delegate?.onClickButton() 
    }
}
//
//protocol StatusButtonDelegate: class {
//    func onClickButton()
//}
