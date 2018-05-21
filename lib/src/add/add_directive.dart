import 'package:angular/angular.dart';

@Directive(
  selector: '[ad-host]',
)
class AdDirective {
  ViewContainerRef viewContainerRef;
  AdDirective(this.viewContainerRef) { }
}