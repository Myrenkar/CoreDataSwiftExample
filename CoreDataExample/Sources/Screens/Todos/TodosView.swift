import UIKit

final class TodosView: View {

    private(set) lazy var addButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .add
            , target: nil, action: nil)
    }()

    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView(frame: .zero)

        return tableView
    }()

    override func setupViewHierarchy() {
        super.setupViewHierarchy()

        [tableView].forEach(addSubview)
    }

    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()

        NSLayoutConstraint.activate([

            tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }

    override func setupProperties() {
        super.setupProperties()

        backgroundColor = .white
    }
}
