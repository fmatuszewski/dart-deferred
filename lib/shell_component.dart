import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'src/todo_list/todo_list_component.dart' deferred as todo_list;
import 'src/ad/ad_service.dart';
import 'package:untitled/src/ad/ad_banner_component.dart';
import 'package:untitled/src/ad/ad_item.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'shell',
  styleUrls: const ['shell_component.css'],
  templateUrl: 'shell_component.html',
  directives: const [materialDirectives,AdBannerComponent],
  providers: const [materialProviders,AdService],
)
class ShellComponent implements OnInit{
  @ViewChild('todoRef', read: ViewContainerRef)
  ViewContainerRef todoRef;

  final ComponentResolver _resolver;
  final AdService _adsService;
  List<AdItem> ads;

  ShellComponent( this._resolver,this._adsService){
    this.ads = _adsService.getAds();
  }

  // Nothing here yet. All logic is in TodoListComponent.
  @override
  ngOnInit() async{
    await todo_list.loadLibrary();
    loadComponent();
  }

  loadComponent() async{
    ComponentFactory factory = await this._resolver.resolveComponent(todo_list.TodoListComponent);
    todoRef.clear();
    todoRef.createComponent(factory);
  }
}
