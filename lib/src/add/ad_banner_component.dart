import 'package:angular/angular.dart';

import 'add_directive.dart';
import 'ad_item.dart';
import 'ad_component.dart';
import 'dart:async';

@Component(
  selector: 'app-ad-banner',
  template: '''
    <div class="ad-banner">
    <h3>Advertisements</h3>
    <ng-template ad-host></ng-template>
    </div>
    ''',
  directives: const[AdDirective]
)
class AdBannerComponent implements OnInit, OnDestroy {
  @Input() List<AdItem> ads;
  int currentAdIndex = -1;
  @ViewChild(AdDirective) AdDirective adHost ;
  int interval;
  StreamSubscription subscription;

  ComponentResolver _componentFactoryResolver;

  AdBannerComponent(this._componentFactoryResolver) { }

  ngOnInit() {
    this.loadComponent();
    this.getAds();
  }

  ngOnDestroy() {
    subscription.cancel();
  }

  loadComponent() async{
    this.currentAdIndex = (this.currentAdIndex + 1) % this.ads.length;
    AdItem adItem = this.ads[this.currentAdIndex];

    ComponentFactory componentFactory = await this._componentFactoryResolver.resolveComponent(adItem.component);

    ViewContainerRef viewContainerRef = this.adHost.viewContainerRef;
    viewContainerRef.clear();

    ComponentRef componentRef = viewContainerRef.createComponent(componentFactory);
    (componentRef.instance as AdComponent).data = adItem.data;
  }

  getAds() {
    var future = new Future.delayed(const Duration(milliseconds: 3000));
    subscription = future.asStream().listen(this.loadComponent());
  }
}


/*
Copyright 2017-2018 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/