import 'package:angular/angular.dart';

import 'dart:async';
import 'package:untitled/src/ad/ad_component.dart';

@Component(
    selector: 'hero-job-ad',
    template: '''<h2>Hero job ad</h2><div class="job-ad"><h4>{{data.headline}}</h4><h3>{{data.bio}}</h3>{{data.body}}</div>'''
)
class HeroJobComponent implements AdComponent{

  @override
  @Input() ComponentData data;

}


/*
Copyright 2017-2018 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/