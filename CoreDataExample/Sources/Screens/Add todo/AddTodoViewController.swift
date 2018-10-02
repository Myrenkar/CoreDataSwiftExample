import UIKit
import CoreData

protocol AddTodoViewControllerDelegate: class {
    func viewControllerDidSaveTodo(_ viewController: AddTodoViewController)
}


final class AddTodoViewController: ViewController {

    private let todoView = AddTodoView()
    private let container: PersistentContainerProtocol

    weak var delegate: AddTodoViewControllerDelegate?

    init(persistentContainer: PersistentContainerProtocol) {
        self.container = persistentContainer
        super.init()
    }

    override func loadView() {
        view = todoView
    }

    override func setupNavigationItem() {
        super.setupNavigationItem()

        todoView.saveButton.target = self
        todoView.saveButton.action = #selector(saveTodo)
        navigationItem.rightBarButtonItem = todoView.saveButton
    }
}

extension AddTodoViewController {
    @objc private func saveTodo() {

        let entity = NSEntityDescription.entity(forEntityName: "Todo", in: container.viewContext)
        let newTodo = NSManagedObject(entity: entity!, insertInto: container.viewContext)

        newTodo.setValue(todoView.contentTextView.text, forKey: "content")
        newTodo.setValue(todoView.nameTextField.text, forKey: "name")
        newTodo.setValue(todoView.nameTextField.text, forKey: "id")

        container.saveContext()

        delegate?.viewControllerDidSaveTodo(self)
    }
}
