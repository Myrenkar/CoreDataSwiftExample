import UIKit

final class AddTodoView: View {

    private(set) lazy var saveButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .save
            , target: nil, action: nil)
    }()

    private(set) lazy var nameTextField: UITextField = {
        let textField = UITextField(frame: .zero)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Add title for your todo"
        textField.backgroundColor = .white

        return textField
    }()


    private(set) lazy var contentTextView: UITextView = {
        let textView = UITextView(frame: .zero)

        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()

    override func setupViewHierarchy() {
        super.setupViewHierarchy()

        [nameTextField, contentTextView].forEach(addSubview)
    }

    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()

        NSLayoutConstraint.activate([

            nameTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            nameTextField.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 96),

            contentTextView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            contentTextView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            contentTextView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 36),
            contentTextView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }

    override func setupProperties() {
        super.setupProperties()

        backgroundColor = .lightGray
    }
}
