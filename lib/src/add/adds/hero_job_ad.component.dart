import 'package:angular/angular.dart';
import '../ad_component.dart';

@Component(
    template: '<div class="job-ad"><h4>{{data.headline}}</h4>{{data.body}}</div>'
)
class HeroJobAdComponent implements AdComponent {

  @override
  @Input() ComponentData data;
}