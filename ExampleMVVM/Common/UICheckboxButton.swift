import UIKit

class UICheckboxButton: UIButton {

    // Trạng thái của checkbox
    private(set) var isChecked: Bool = false {
        didSet {
            updateAppearance()
        }
    }

    // MARK: - Init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: - Setup
    private func setup() {
        addTarget(self, action: #selector(toggleCheck), for: .touchUpInside)
        contentHorizontalAlignment = .left
        updateAppearance()
    }

    // MARK: - Toggle
    @objc private func toggleCheck() {
        isChecked.toggle()
    }

    // MARK: - Update UI
    private func updateAppearance() {
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
        let imageName = isChecked ? "checkmark.square.fill" : "square"
        let image = UIImage(systemName: imageName, withConfiguration: config)
        setImage(image, for: .normal)
//        setTitle("  Checkmark", for: .normal)
        setTitleColor(.label, for: .normal)
    }

    // Optional: public setter
    func setChecked(_ checked: Bool) {
        isChecked = checked
    }
}
