import 'package:angular/angular.dart';
import '../ad_component.dart';

@Component(
  template: '<div class="job-ad"><h4>{{data.headline}}</h4>{{data.body}}<strong>Hire this hero today!</strong></div>'
)
class HeroProfileComponent implements AdComponent {

  @override
  @Input() ComponentData data;
}