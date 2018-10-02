import UIKit
import CoreData

final class TodosViewController: ViewController {

    private let todoView = TodosView()
    private let container: PersistentContainerProtocol
    private var todos: [NSManagedObject] = [] {
        didSet {
            DispatchQueue.main.async {
                self.todoView.tableView.reloadData()
            }
        }
    }

    init(persistentContainer: PersistentContainerProtocol) {
        self.container = persistentContainer
        super.init()
        fetchTodos()
    }

    override func loadView() {
        view = todoView
    }

    override func setupNavigationItem() {
        super.setupNavigationItem()

        todoView.addButton.target = self
        todoView.addButton.action = #selector(addTodo)
        navigationItem.rightBarButtonItem = todoView.addButton
    }

    override func setupProperties() {
        super.setupProperties()

        todoView.tableView.register(SimpleCell.self, forCellReuseIdentifier: "TodoCell")
        todoView.tableView.dataSource = self
    }
}

extension TodosViewController {
    @objc private func addTodo() {
        let addTodoViewController = AddTodoViewController(persistentContainer: container)
        addTodoViewController.delegate = self

        navigationController?.present(UINavigationController(rootViewController: addTodoViewController), animated: true, completion: nil)
    }

    private func fetchTodos() {
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Todo")
        do {
            let object = try container.viewContext.fetch(fetchRequest)
            todos.removeAll()
            todos.append(contentsOf: object)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}

extension TodosViewController: AddTodoViewControllerDelegate {
    func viewControllerDidSaveTodo(_ viewController: AddTodoViewController) {
        viewController.dismiss(animated: true) {
            self.fetchTodos()
        }
    }
}

extension TodosViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? SimpleCell else { fatalError() }

        let currentTodo = todos[indexPath.row]
        cell.textLabel?.text = currentTodo.value(forKeyPath: "name") as? String
        cell.detailTextLabel?.text = currentTodo.value(forKeyPath: "content") as? String
        return cell
    }
}
