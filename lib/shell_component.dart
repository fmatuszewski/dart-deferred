import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'src/todo_list/todo_list_component.dart' deferred as todo_list;
import 'src/add/ad_service.dart';
//import 'package:untitled/src/add/ad_banner_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'shell',
  styleUrls: const ['shell_component.css'],
  templateUrl: 'shell_component.html',
  directives: const [materialDirectives],
  providers: const [materialProviders,AdService],

)
class ShellComponent implements OnInit{
  @ViewChild('todoRef', read: ViewContainerRef)
  ViewContainerRef todoRef;

  final ComponentLoader _loader;
  final ComponentResolver _resolver;

  ShellComponent(this._loader, this._resolver);

  // Nothing here yet. All logic is in TodoListComponent.
  @override
  ngOnInit() async{
    await todo_list.loadLibrary();
    loadComponent();
//    _loader.loadNextToLocation(factory, todoRef);
  }

  loadComponent() async{
    ComponentFactory factory = await this._resolver.resolveComponent(todo_list.TodoListComponent);
    todoRef.clear();
    todoRef.createComponent(factory);
  }
}
